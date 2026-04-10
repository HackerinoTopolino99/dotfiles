vim.pack.add({ "https://github.com/nvim-treesitter/nvim-treesitter" })

require("nvim-treesitter").setup()
require("nvim-treesitter").install({
  "asm",
  "bash",
  "dockerfile",
  "gitignore",
	"go",
  "hcl",
  "java",
	"jinja",
	"jinja_inline",
	"python",
  "ssh_config",
	"yaml",
})

vim.cmd("TSUpdate")
