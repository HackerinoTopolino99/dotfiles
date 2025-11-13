return {
  "nvim-lualine/lualine.nvim",
  config = function()
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
        always_show_tabline = false,
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
          "swenv",
          {
            "diagnostics",
            sources = { "nvim_lsp", "nvim_diagnostic" },
            sections = { "error", "warn", "info", "hint" },

            diagnostics_color = {},
            symbols = { error = "E", warn = "W", info = "I", hint = "H" },
            update_in_insert = true,
            always_visibile = false,
          },
        },
        lualine_c = { "filename", "filetype", "fileformat" },
        lualine_x = { "searchcount" },
        lualine_y = {},
        lualine_z = { "location" },
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
            tab_max_length = 90,
            max_length = vim.o.columns,
            mode = 1,
            path = 1,
            use_mode_colors = false,

            -- Not working
            -- tabs_color = {
            --  active = "lualine_{section}_normal",
            --  inactive = "lualine_{section}_inactive",
            --},

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
        lualine_c = {},
        lualine_x = {},
        lualine_y = {},
        lualine_z = {},
      },
      winbar = {},
      inactive_winbar = {},
      extensions = {
        "lazy",
        "neo-tree",
        "toggleterm",
      },
    })
  end,
}
