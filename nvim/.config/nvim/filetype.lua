vim.filetype.add({
	extension = {
		["mdx"] = "mdx",
	},
	filename = {
		["docker-compose.yml"] = "yaml.docker-compose",
		["docker-compose.yaml"] = "yaml.docker-compose",
		["compose.yml"] = "yaml.docker-compose",
		["compose.yaml"] = "yaml.docker-compose",
		[".gitlab-ci.yml"] = "yaml.gitlab",
		["terraform.tfvars"] = "terraform-vars",
		["terraform.tfvars.json"] = "terraform-vars",
	},
	pattern = {
		[".*gitlab%-ci%.yml"] = "yaml.gitlab",
		[".*%.auto%.tfvars"] = "terraform-vars",
		[".*%.auto%.tfvars.json"] = "terraform-vars",
	},
})
