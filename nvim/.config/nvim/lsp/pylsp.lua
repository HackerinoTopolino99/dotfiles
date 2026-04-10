return {
	cmd = { "pylsp" },
	filetypes = { "python" },
	single_file_support = true,
	root_markers = {
		"pyproject.toml",
		"setup.py",
		"setup.cfg",
		"requirements.txt",
		"Pipfile",
		".git",
	},

	settings = {
		pylsp = {
			configurationSources = { "flake8" },
			plugins = {
				autopep8 = {
					enabled = true,
				},
				flake8 = {
					enabled = true,
					indentSize = 4,
				},
				mccabe = {
					enabled = false,
				},
				preload = {
					enabled = false,
				},
				pycodestyle = {
					enabled = false,
				},
				pyflakes = {
					enabled = false,
				},
				yapf = {
					enabled = false,
				},
			},
		},
	},
}
