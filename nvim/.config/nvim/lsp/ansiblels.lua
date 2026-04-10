return {
	cmd = { "ansible-language-server", "--stdio" },
	settings = {
		ansible = {
			python = {
				interpreterPath = "python",
			},
			ansible = {
				path = "ansible",
			},
			executionEnvironment = {
				enabled = false,
			},
			validation = {
				enabled = true,
				lint = {
					enabled = true,
					path = "ansible-lint",
				},
			},
		},
	},
	filetypes = { "ansible" },
	root_markers = {
		"ansible.cfg",
		"inventory",
		"inventory.yml",
		"inventory.example",
		"inventory.yml.example",
		"site.yml",
		"main.yml",
		".ansible-lint",
	},
}
