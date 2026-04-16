vim.pack.add({
	"https://github.com/stevearc/conform.nvim",
})

require("conform").setup({
	formatters_by_ft = {
		hcl = { "packer_fmt" },
		lua = { "stylua" },
		nginx = { "nginxfmt" },
		sh = { "shfmt" },
		tex = { "tex-fmt" },
	},
	default_format_opts = {
		lsp_format = "fallback",
	},
})

vim.keymap.set({ "n" }, "<leader>f", function()
	require("conform").format({})
end)
