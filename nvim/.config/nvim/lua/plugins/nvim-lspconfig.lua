vim.pack.add({
	"https://github.com/neovim/nvim-lspconfig",
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

-- LSP Mappings
vim.keymap.set({ "n" }, "<leader>k", vim.lsp.buf.hover, {})
vim.keymap.set({ "n" }, "<leader>gd", function()
	vim.lsp.buf.definition({
		on_list = function(options)
			if #options.items > 0 then
				local item = options.items[1]
				local current_file = vim.api.nvim_buf_get_name(0)

				if item.filename ~= current_file then
					vim.cmd("tab split")
				end

				vim.cmd("edit " .. item.filename)
				vim.api.nvim_win_set_cursor(0, { item.lnum, math.max(0, item.col - 1) })
			end
		end,
	})
end, { buffer = true, silent = true })

vim.keymap.set({ "n" }, "<leader>gr", vim.lsp.buf.references)
vim.keymap.set({ "n" }, "<leader>ca", vim.lsp.buf.code_action, {})
vim.keymap.set({ "n" }, "<leader>rn", vim.lsp.buf.rename, {})
