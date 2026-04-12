vim.pack.add({
	"https://github.com/stevearc/conform.nvim",
})

require("conform").setup({
	formatters_by_ft = {
		hcl = { "hclfmt" },
		lua = { "stylua" },
    markdown = { "Markdown "},
    sh = { "shfmt" },
    tex = { "tex-fmt"},
    yaml = { "prettier" }
	},
  default_format_opts = {
    lsp_format = "fallback"
  },
})
