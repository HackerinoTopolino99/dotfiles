vim.pack.add({
    { src = "https://github.com/L3MON4D3/LuaSnip" },
    { src = "https://github.com/rafamadriz/friendly-snippets" },
    { src = "https://github.com/chrisgrieser/nvim-scissors" },
})

local ls = require("luasnip")

ls.config.setup({
    enable_autosnippets = true,
    update_events = "TextChanged,TextChangedI",
    delete_check_events = "TextChanged",
})

require("luasnip.loaders.from_vscode").lazy_load()
require("luasnip.loaders.from_vscode").lazy_load({
    paths = { vim.fn.stdpath("config") .. "/snippets" },
})
require("luasnip.loaders.from_lua").lazy_load({
    paths = { vim.fn.stdpath("config") .. "/luasnippets" },
})

vim.keymap.set({ "i", "s" }, "<C-j>", function()
    if ls.jumpable(1) then ls.jump(1) end
end, { silent = true, desc = "LuaSnip: Salto successivo" })

vim.keymap.set({ "i", "s" }, "<C-k>", function()
    if ls.jumpable(-1) then ls.jump(-1) end
end, { silent = true, desc = "LuaSnip: Salto precedente" })

vim.keymap.set({ "i", "s" }, "<C-c>", function()
    if ls.in_snippet() then ls.unlink_current() end
end, { silent = true, desc = "LuaSnip: Annulla sessione attiva" })

require("scissors").setup({
    snippetDir = vim.fn.stdpath("config") .. "/snippets",
})

vim.keymap.set("n", "<leader>se", function()
    require("scissors").editSnippet()
end, { desc = "Scissors: Modifica snippet" })

vim.keymap.set({ "n", "x" }, "<leader>sa", function()
    require("scissors").addNewSnippet()
end, { desc = "Scissors: Aggiungi snippet" })
