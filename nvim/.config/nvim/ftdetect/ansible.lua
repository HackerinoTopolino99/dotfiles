local function is_ansible(path, bufnr)
	if
		path:match("/tasks/.*%.ya?ml$")
		or path:match("/roles/.*%.ya?ml$")
		or path:match("/handlers/.*%.ya?ml$")
		or path:match("/group_vars/")
		or path:match("/host_vars/")
	then
		return "yaml.ansible"
	end

	local filename = vim.fn.fnamemodify(path, ":t")
	if vim.g.ansible_ftdetect_filename_regex then
		if vim.regex(vim.g.ansible_ftdetect_filename_regex):match_str(filename) then
			return "yaml.ansible"
		end
	else
		if
			filename:match("^playbook%.ya?ml$")
			or filename:match("^site%.ya?ml$")
			or filename:match("^main%.ya?ml$")
			or filename:match("^local%.ya?ml$")
			or filename:match("^requirements%.ya?ml$")
		then
			return "yaml.ansible"
		end
	end

	local first_line = vim.api.nvim_buf_get_lines(bufnr, 0, 1, false)[1] or ""
	if
		first_line:match("^#!.*/bin/env%s+yaml.ansible%-playbook")
		or first_line:match("^#!.*/bin/yaml.ansible%-playbook")
	then
		return "yaml.ansible"
	end
end

local function setup_template(path, _)
	if vim.g.ansible_template_syntaxes then
		for syntax_name, ft in pairs(vim.g.ansible_template_syntaxes) do
			if path:find("/" .. syntax_name, 1, true) then
				return ft .. ".jinja2"
			end
		end
	end
	return "jinja2"
end

-- Registrazione dei filetype nel motore nativo
vim.filetype.add({
	filename = {
		["hosts"] = "ansible_hosts",
	},
	extension = {
		["j2"] = setup_template,
	},
	pattern = {
		[".*"] = is_ansible,
	},
})
