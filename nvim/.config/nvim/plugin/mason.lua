vim.pack.add({
	{ src = "https://github.com/mason-org/mason.nvim" },
	{ src = "https://github.com/mason-org/mason-lspconfig.nvim" },
	{ src = "https://github.com/jay-babu/mason-null-ls.nvim" },
})

require("mason").setup()
require("mason-lspconfig").setup({
	ensure_installed = {
		"ansiblels",
		"bashls",
		"docker_language_server",
		"gitlab_ci_ls",
		"gh_actions_ls",
		"jsonls",
		"ltex_plus",
		"lemminx",
		"lua_ls",
		-- "nginx_language_server",
		"pylsp",
		"systemd_lsp",
		"tofu_ls",
		"tombi",
		"yamlls",
	},
})

require("mason-null-ls").setup({
	ensure_installed = {
		"actionlint",
		"ansible-lint",
		"autopep8",
		"flake8",
		"hclfmt",
		"nginx-config-formatter",
		"opentofu_fmt",
		"opentofu_validate",
		"packer",
		"shfmt",
		"systemdlint",
		"stylua",
		"tflint",
		"tfsec",
		"tex_fmt",
		"xmlformatter",
		"yamllint",
	},
	automatic_installation = false,
	handlers = {},
})
