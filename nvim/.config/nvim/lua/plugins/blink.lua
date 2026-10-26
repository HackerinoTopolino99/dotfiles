vim.api.nvim_create_autocmd("PackChanged", {
	desc = "Build blink.cmp after install/update",
	group = vim.api.nvim_create_augroup("blink_build", { clear = true }),
	callback = function(ev)
		local name, kind = ev.data.spec.name, ev.data.kind
		if name == "blink.cmp" and (kind == "install" or kind == "update") then
			vim.notify("Building blink.cmp...", vim.log.levels.INFO)
			local obj = vim.system({ "cargo", "build", "--release" }, { cwd = ev.data.path }):wait()
			if obj.code == 0 then
				vim.notify("Building blink.cmp done", vim.log.levels.INFO)
			else
				vim.notify("Building blink.cmp failed", vim.log.levels.ERROR)
			end
		end
	end,
})

vim.pack.add({
	{ src = "https://github.com/Saghen/blink.cmp" },
	{ src = "https://github.com/Saghen/blink.lib" },
})

require("blink.cmp").setup({
	snippets = { preset = "luasnip" },

	keymap = {
		preset = "none",

		-- Navigazione classica stile nvim-cmp
		["<C-n>"] = { "select_next", "fallback" },
		["<C-p>"] = { "select_prev", "fallback" },
		["<Down>"] = { "select_next", "fallback" },
		["<Up>"] = { "select_prev", "fallback" },

		-- Controllo menu e documentazione
		["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
		["<C-e>"] = { "hide", "fallback" },
		["<C-b>"] = { "scroll_documentation_up", "fallback" },
		["<C-f>"] = { "scroll_documentation_down", "fallback" },

		-- Invio: accetta SOLO se hai selezionato una voce col cursore, altrimenti va a capo
		["<CR>"] = { "accept", "fallback" },

		-- Tab nativo di Blink:
		-- 1. Se sei in uno snippet LuaSnip -> salta al campo successivo (snippet_forward)
		-- 2. Se c'è il menu aperto -> accetta il completamento (select_and_accept)
		-- 3. Altrimenti -> inserisce un Tab normale (fallback)
		["<Tab>"] = { "snippet_forward", "select_and_accept", "fallback" },
		["<S-Tab>"] = { "snippet_backward", "fallback" },
	},

	completion = {
		list = {
			-- Non preseleziona nulla: evita che premere <CR> inserisca testo a caso
			selection = {
				preselect = false,
				auto_insert = false,
			},
		},
		menu = {
			auto_show = true,
			draw = {
				treesitter = { "lsp" },
				columns = { { "kind_icon", "label", "label_description", gap = 1 }, { "kind" } },
			},
		},
		documentation = {
			auto_show = true,
		},
	},

	signature = { enabled = true },
	fuzzy = { implementation = "lua" },

	sources = {
		default = { "lsp", "path", "snippets", "buffer" },
		per_filetype = {
			sql = { "lsp", "snippets", "buffer" },
		},
		providers = {
			lsp = {
				score_offset = 90,
			},
			buffer = {
				min_keyword_length = 3,
			},
		},
	},
})
