vim.api.nvim_create_autocmd("UiEnter", {
	callback = function(data)
		local path = vim.fn.fnamemodify(data.file, ":h")
		if vim.fn.isdirectory(path) == 1 then
			vim.cmd("cd " .. path)
			vim.cmd("Neotree show")
		end
	end,
})

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		local client = vim.lsp.get_client_by_id(args.data.client_id)
		if client and client:supports_method("textDocument/completion") then
			vim.opt.completeopt = { "menuone", "noselect", "popup", "fuzzy" }
			vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
		end
	end,
})
