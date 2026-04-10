vim.pack.add({
	"https://github.com/neovim/nvim-lspconfig",
})

local cmp_lsp = require("cmp_nvim_lsp")
local capabilities =
	vim.tbl_deep_extend("force", {}, vim.lsp.protocol.make_client_capabilities(), cmp_lsp.default_capabilities())

vim.lsp.config("*", {
	capabilities = capabilities,
})


-- Diagnostics
vim.diagnostic.config({
	virtual_lines = true,
	update_in_insert = false,
	signs = true,
})
