vim.opt.softtabstop = 4
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

-- Keywords
vim.api.nvim_set_hl(0, "@keyword.python", { fg = "#FF8000" })
vim.api.nvim_set_hl(0, "@keyword.conditional.python", { fg = "#FF8000" })
vim.api.nvim_set_hl(0, "@keyword.coroutine.python", { fg = "#FF8000" })
vim.api.nvim_set_hl(0, "@keyword.exception.python", { fg = "#FF8000" })
vim.api.nvim_set_hl(0, "@keyword.import.python", { fg = "#FF8000" })
vim.api.nvim_set_hl(0, "@keyword.function.python", { fg = "#FF8000" })
vim.api.nvim_set_hl(0, "@keyword.operator.python", { fg = "#FF8000"})
vim.api.nvim_set_hl(0, "@keyword.repeat.python", { fg = "#FF8000" })
vim.api.nvim_set_hl(0, "@keyword.return.python", { fg = "#FF8000" })
vim.api.nvim_set_hl(0, "@keyword.type.python", { fg = "#FF8000" })

-- Data types
vim.api.nvim_set_hl(0, "@string.python", { fg = "#02FF02" })
vim.api.nvim_set_hl(0, "@boolean.python", { fg = "#FF8000" })
vim.api.nvim_set_hl(0, "@constant.builtin", { fg = "#FF8000"})

-- Functions and methods
vim.api.nvim_set_hl(0, "@constructor.python", { fg = "#5e5eff" })
vim.api.nvim_set_hl(0, "@function.python", { fg = "#5e5eff" })
vim.api.nvim_set_hl(0, "@function.builtin.python", { fg = "#FF00FF" })
vim.api.nvim_set_hl(0, "@function.call.python", { fg = "#FFFFFF"})
vim.api.nvim_set_hl(0, "@method.call.python", { fg = "#FFFFFF"})

-- Types
vim.api.nvim_set_hl(0, "@type.python", { fg = "#5e5eff" })
vim.api.nvim_set_hl(0, "@type.builtin.python", { fg = "#FF00FF" })

-- Comments
vim.api.nvim_set_hl(0, "@comment.python", { fg = "#DD0000"})

