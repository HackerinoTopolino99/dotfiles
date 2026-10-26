vim.pack.add({
	"https://github.com/nvim-treesitter/nvim-treesitter",
	-- 'https://github.com/nvim-mini/mini.nvim',            -- if you use the mini.nvim suite
	-- 'https://github.com/nvim-mini/mini.icons',        -- if you use standalone mini plugins
	"https://github.com/nvim-tree/nvim-web-devicons", -- if you prefer nvim-web-devicons
	"https://github.com/MeanderingProgrammer/render-markdown.nvim",
})
require("render-markdown").setup({
	latex = {
		enabled = true,
		converter = "pdftoppm", -- oppure 'latex' se hai TeX Live installato
		highlight = "RenderMarkdownMath",
		top_pad = 0,
		bottom_pad = 0,
	},
	heading = {
		sign = false,
		icons = { "󰲡 ", "󰲣 ", "󰲥 ", "󰲧 ", "󰲩 ", "󰲫 " },
	},
	bullet = {
		icons = { "●", "○", "◆", "◇" },
	},
	completions = { lsp = { enabled = true } },
})
