vim.g.mapleader = " "

-- Navigation Mappings
vim.keymap.set({ "n", "i", "v" }, "<C-right>", "<cmd>tabnext<CR>")
vim.keymap.set({ "n", "i", "v" }, "<C-Left>", "<cmd>tabprevious<CR>")
vim.keymap.set({ "n", "v" }, "<C-d>", "<C-d>zz")
vim.keymap.set({ "n", "v" }, "<C-u>", "<C-u>zz")
vim.keymap.set({ "n" }, "n", "nzz")
vim.keymap.set({ "n" }, "N", "Nzz")

-- System clipboard interaction
vim.keymap.set({ "n", "v" }, "<leader>p", [["+p]])
vim.keymap.set({ "n", "v" }, "<leader>P", [["+P]])
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set({ "n", "v" }, "<leader>Y", [["+Y]])
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- Usefull keybindings
vim.keymap.set({ "n" }, "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set({ "n" }, "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
vim.keymap.set({ "n" }, "t", "<C-w><CR><C-w>T")
