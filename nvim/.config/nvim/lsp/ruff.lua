-- ---@type vim.lsp.Config
return {
	cmd = { "ruff", "server" },
	filetypes = { "python" },
	root_markers = { "pyproject.toml", "ruff.toml", ".ruff.toml", "requirements.txt" },
	settings = {
		configuration = {
			["line-length"] = 79,
			organizeImports = false,
			showSyntaxErrors = false,
			disableRuleComment = {
				enable = true,
			},
			fixViolation = {
				enable = true,
			},
			lint = {
				select = {
					"E4",
					"E7",
					"E9",
					"F",
					"I",
					"B",
					"UP",
				},
			},
			format = {
				["quote-style"] = "double",
			},
		},
	},
}
