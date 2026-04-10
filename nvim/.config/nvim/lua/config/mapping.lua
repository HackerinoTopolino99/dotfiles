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

-- NeoTree Mappings
vim.keymap.set({ "n", "v", "i" }, "<C-b>", "<cmd>Neotree toggle action=show<CR>")
vim.keymap.set({ "n" }, "<leader>e", "<cmd>Neotree reveal<CR>")

-- ToggleTerm Mappings
vim.keymap.set({ "n", "v" }, "<leader>t", "<cmd>ToggleTerm<CR>")

-- LSP Mappings
vim.keymap.set({ "n" }, "<leader>k", vim.lsp.buf.hover, {})

vim.keymap.set({ "n" }, "<leader>gd", function()
  vim.lsp.buf.definition({
		on_list = function(options)
			if #options.items > 0 then
				local item = options.items[1]
        local current_file = vim.api.nvim_buf_get_name(0)

        if item.filename ~= current_file then
			    vim.cmd("tab split")
        end

				vim.cmd("edit " .. item.filename)
				vim.api.nvim_win_set_cursor(0, { item.lnum, math.max(0, item.col - 1) })
			end
		end,
	})
end, {buffer = true, silent = true})

vim.keymap.set({ "n" }, "<leader>gr", vim.lsp.buf.references)
vim.keymap.set({ "n" }, "<leader>ca", vim.lsp.buf.code_action, {})
vim.keymap.set({ "n" }, "<leader>rn", vim.lsp.buf.rename, {})
vim.keymap.set({ "n" }, "<leader>f", vim.lsp.buf.format)

-- Fzf Mappings
vim.keymap.set({ "n", "i", "v" }, "<C-f>", "<cmd>FzfLua files<CR>")
