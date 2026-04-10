vim.pack.add({
	{ src = "https://github.com/pearofducks/ansible-vim", name = "ansible" },
})

require("ansible").setup()
