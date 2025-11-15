return {
	"ibhagwan/fzf-lua",
	-- optional for icon support
	dependencies = { "nvim-tree/nvim-web-devicons" },
	-- or if using mini.icons/mini.nvim
	-- dependencies = { "nvim-mini/mini.icons" },
	opts = {},
	config = function()
		local FzfLua = require("fzf-lua")
		FzfLua.setup({
			actions = {
				files = {
					false,
					["enter"] = FzfLua.actions.file_edit_or_qf,
					["ctrl-h"] = FzfLua.actions.file_split,
					["ctrl-v"] = FzfLua.actions.file_vsplit,
					["ctrl-t"] = FzfLua.actions.file_tabedit,
					["alt-q"] = FzfLua.actions.file_sel_to_qf,
					["alt-Q"] = FzfLua.actions.file_sel_to_ll,
					["alt-i"] = FzfLua.actions.toggle_ignore,
					["alt-h"] = FzfLua.actions.toggle_hidden,
					["alt-f"] = FzfLua.actions.toggle_follow,
				},
			},
		})
	end,
}
