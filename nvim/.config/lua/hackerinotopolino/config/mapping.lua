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

-- NeoTree Mappings
vim.keymap.set({ "n", "v", "i" }, "<C-b>", "<cmd>Neotree toggle action=show<CR>")
vim.keymap.set({ "n" }, "<leader>e", "<cmd>Neotree reveal<CR>")

-- ToggleTerm Mappings
vim.keymap.set({ "n", "v" }, "<leader>t", "<cmd>ToggleTerm<CR>")

-- LSP Mappings
vim.keymap.set({ "n" }, "K", vim.lsp.buf.hover, {})
vim.keymap.set({ "n" }, "<leader>gd", vim.lsp.buf.definition, {})
vim.keymap.set({ "n" }, "<leader>gr", vim.lsp.buf.references, {})
vim.keymap.set({ "n" }, "<leader>ca", vim.lsp.buf.code_action, {})
vim.keymap.set({ "n" }, "<leader>gf", vim.lsp.buf.format, {})
vim.keymap.set({ "n" }, "<space>rn", vim.lsp.buf.rename, {})
vim.keymap.set({ "n" }, "<leader>f", vim.lsp.buf.format)

-- Usefull keybindings
vim.keymap.set({ "n" }, "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set({ "n" }, "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
