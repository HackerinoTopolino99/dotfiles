vim.pack.add({
	{
		src = "https://github.com/nvim-neo-tree/neo-tree.nvim",
		version = vim.version.range("3"),
	},
	-- dependencies
	"https://github.com/nvim-lua/plenary.nvim",
	"https://github.com/MunifTanjim/nui.nvim",
	-- optional, but recommended
	"https://github.com/nvim-tree/nvim-web-devicons",
	"https://github.com/miversen33/netman.nvim",
})

require("neo-tree").setup({
	close_if_last_window = false,
	popup_border_style = "",
	clipboard = {
		sync = "global",
	},
	sort_case_insensitive = true,
	default_component_configs = {
		file_size = {
			enabled = false,
		},
		type = {
			enabled = false,
		},
		last_modified = {
			enabled = false,
		},
		created = {
			enabled = false,
		},
		symlink_target = {
			enabled = true,
		},
	},
	commands = {},
	sources = {
		"filesystem",
		"buffers",
		"git_status",
		"netman.ui.neo-tree",
	},
	source_selector = {
		winbar = true,
		status_line = false,
		sources = {
			{
				source = "filesystem",
			},
			{
				source = "git_status",
			},
			{
				source = "remote",
			},
		},
	},
	filesystem = {
		filtered_items = {
			visible = false,
			hide_dotfiles = true,
			hide_gitignored = false,
			always_show = {},
			always_show_by_pattern = {
				".env*",
				".git*",
			},
		},
	},
	git_status = {
		window = {
			position = "float",
			mappings = {
				["g"] = {
					"show_help",
					nowait = false,
					config = { title = "Git Commands", prefix_key = "g" },
				},
				["gA"] = "git_add_all",
				["gu"] = "git_unstage_file",
				["gU"] = "git_undo_last_commit",
				["ga"] = "git_add_file",
				["gt"] = "git_toggle_file_stage",
				["gr"] = "git_revert_file",
				["gc"] = "git_commit",
				["gp"] = "git_push",
				["gg"] = "git_commit_and_push",
				["o"] = {
					"show_help",
					nowait = false,
					config = { title = "Order by", prefix_key = "o" },
				},
				["oc"] = { "order_by_created", nowait = false },
				["od"] = { "order_by_diagnostics", nowait = false },
				["om"] = { "order_by_modified", nowait = false },
				["on"] = { "order_by_name", nowait = false },
				["os"] = { "order_by_size", nowait = false },
				["ot"] = { "order_by_type", nowait = false },
			},
		},
	},
	event_handlers = {
		{
			event = "neo_tree_buffer_enter",
			handler = function()
				-- This effectively hides the cursor
				vim.cmd("highlight! Cursor blend=100")
			end,
		},
		{
			event = "neo_tree_buffer_leave",
			handler = function()
				-- Make this whatever your current Cursor highlight group is.
				vim.cmd("highlight! Cursor guibg=#5f87af blend=0")
			end,
		},
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

-- Disable netrw
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.o.showmode = false

-- NeoTree Mappings
vim.keymap.set({ "n", "v", "i" }, "<C-b>", "<cmd>Neotree toggle action=show<CR>")
vim.keymap.set({ "n" }, "<leader>e", "<cmd>Neotree reveal<CR>")
