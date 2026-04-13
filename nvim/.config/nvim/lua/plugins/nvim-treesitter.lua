vim.pack.add({
	{ src = "https://github.com/nvim-treesitter/nvim-treesitter"},
})

require("nvim-treesitter").setup()
require("nvim-treesitter").install({
	"asm",
	"bash",
	"c",
	"dockerfile",
	"gitignore",
	"go",
	"hcl",
	"hyprlang",
	"ini",
	"java",
	"javascript",
	"jinja",
	"jinja_inline",
	"json",
	"latex",
	"lua",
	"make",
	"markdown",
	"markdown_inline",
	"nginx",
	"objdump",
	"python",
	"requirements",
	"ssh_config",
	"terraform",
	"typescript",
	"yaml",
	"zsh",
})

vim.api.nvim_create_autocmd("PackChanged", {
	pattern = "*",

	callback = function(ev)
		local data = ev.data
		if not data or not data.spec or data.kind ~= "update" then
			return
		end

		local spec_str = type(data.spec) == "string" and data.spec or (data.spec.src or data.spec.name or "")

		if spec_str:match("nvim-treesitter") then
			vim.schedule(function()
				vim.cmd("packadd nvim-treesitter")
				vim.cmd("TSUpdate")
			end)
		end
	end,
})
