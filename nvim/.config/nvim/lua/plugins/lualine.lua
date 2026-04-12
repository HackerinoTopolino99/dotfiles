vim.pack.add({
	{ src = "https://github.com/nvim-lualine/lualine.nvim" },
	"https://github.com/nvim-tree/nvim-web-devicons",
})

require("lualine").setup({
	options = {
		icons_enabled = true,
		theme = "nightfly",
		component_separators = { left = "", right = "" },
		section_separators = { left = "", right = "" },
		disabled_filetypes = {
			statusline = {},
			winbar = {},
		},
		ignore_focus = {},
		always_divide_middle = true,
		always_show_tabline = true,
		globalstatus = true,
		refresh = {
			statusline = 100,
			tabline = 100,
			winbar = 100,
		},
	},
	sections = {
		lualine_a = { "mode" },
		lualine_b = {
			"branch",
			"diagnostics",
		},
		lualine_c = { "filename", "filetype", "fileformat" },
		lualine_x = { "searchcount" },
		lualine_y = { "location" },
		lualine_z = {
			{
				"lsp_status",
				icon = "", -- f013
				symbols = {
					-- Standard unicode symbols to cycle through for LSP progress:
					spinner = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" },
					-- Standard unicode symbol for when LSP is done:
					done = "✓",
					-- Delimiter inserted between LSP names:
					separator = " ",
				},
				-- List of LSP names to ignore (e.g., `null-ls`):
				ignore_lsp = {},
				-- Display the LSP name
				show_name = true,
			},
		},
	},
	inactive_sections = {
		lualine_a = {},
		lualine_b = {},
		lualine_c = { "filename" },
		lualine_x = { "location" },
		lualine_y = {},
		lualine_z = {},
	},
	tabline = {
		lualine_a = {
			"branch",
		},
		lualine_b = {
			{
				"tabs",
				tab_max_length = 40,
				max_length = vim.o.columns / 3,
				mode = 0,
				path = 0,
				use_mode_colors = false,

				show_modified_status = true,
				symbols = {
					modified = "[+]",
				},

				fmt = function(name, context)
					local buflist = vim.fn.tabpagebuflist(context.tabnr)
					local winnr = vim.fn.tabpagewinnr(context.tabnr)
					local bufnr = buflist[winnr]
					local mod = vim.fn.getbufvar(bufnr, "&mod")

					return name .. (mod == 1 and " +" or "")
				end,
			},
		},
		lualine_c = {
			{
				"windows",
				show_filename_only = false,
				show_modified_status = true,
				mode = 0,
				max_length = vim.o.columns * 2 / 3,

				filetype_name = {
					fzf = "FZF",
				},
				disabled_buftypes = { "quickfix", "prompt", "nofile" },
			},
		},
		lualine_x = {},
		lualine_y = {},
		lualine_z = {},
	},
	winbar = {},
	inactive_winbar = {},
	extensions = {
		"mason",
		"neo-tree",
		"toggleterm",
	},
})

vim.api.nvim_create_autocmd("UiEnter", {
	callback = function(data)
		local path = vim.fn.fnamemodify(data.file, ":h")
		if vim.fn.isdirectory(path) == 1 then
			vim.cmd("cd " .. path)
			vim.cmd("Neotree show")
		end
	end,
})
