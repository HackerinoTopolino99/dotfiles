vim.api.nvim_create_user_command("LspInfo", function(opts)
    vim.cmd("checkhealth vim.lsp")
end, { nargs = 0, desc = "Alias for checkhealth vim.lsp" })
