vim.pack.add({
	"https://github.com/neovim/nvim-lspconfig",
})

-- Diagnostics
vim.diagnostic.config({
	virtual_lines = true,
	update_in_insert = false,
	signs = true,
})
