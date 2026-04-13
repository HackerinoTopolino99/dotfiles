vim.pack.add({
	"https://github.com/stevearc/conform.nvim",
})

require("conform").setup({
	formatters_by_ft = {
		hcl = { "hclfmt" },
		lua = { "stylua" },
    nginx = { "nginxfmt" },
    sh = { "shfmt" },
    tex = { "tex-fmt"},
	},
  default_format_opts = {
    lsp_format = "fallback"
  },
})
