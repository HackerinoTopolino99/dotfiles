return {
	{
		"mason-org/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"mason-org/mason-lspconfig.nvim",
		config = function()
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
					"nginx_language_server",
					"pyright",
					"systemd_ls",
					"tofu_ls",
          "tombi",
					"yamlls",
				},
			})
		end,
	},
	{
		"jay-babu/mason-null-ls.nvim",
		config = function()
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
		end,
	},
}
