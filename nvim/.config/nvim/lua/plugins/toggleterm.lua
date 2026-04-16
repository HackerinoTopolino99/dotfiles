vim.pack.add({
	{ src = "https://github.com/akinsho/toggleterm.nvim" },
})

require("toggleterm").setup({
	size = 12,
})

vim.keymap.set({ "n" }, "<leader>t", "<cmd>ToggleTerm<CR>")
