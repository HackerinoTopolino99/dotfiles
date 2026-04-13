vim.pack.add({
	{ src = "https://github.com/akinsho/toggleterm.nvim" },
})

require("toggleterm").setup({
	size = 10,
})

-- ToggleTerm Mappings
vim.keymap.set({ "n", "v" }, "<leader>t", "<cmd>ToggleTerm<CR>")
