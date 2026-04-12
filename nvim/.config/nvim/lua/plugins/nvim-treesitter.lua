vim.pack.add({ "https://github.com/nvim-treesitter/nvim-treesitter" })

require("nvim-treesitter").setup()
require("nvim-treesitter").install({
	"asm",
	"bash",
	"c",
	"dockerfile",
	"gitignore",
	"go",
	"hcl",
	"java",
	"jinja",
	"jinja_inline",
	"latex",
	"make",
	"nginx",
	"python",
	"ssh_config",
	"terraform",
	"yaml",
})
