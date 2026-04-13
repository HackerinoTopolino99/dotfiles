vim.pack.add({
	{ src = "https://github.com/ibhagwan/fzf-lua" },
	"https://github.com/nvim-tree/nvim-web-devicons",
})

require("fzf-lua").setup()
vim.keymap.set({ "n", "i", "v" }, "<C-f>", "<cmd>FzfLua files<CR>")
