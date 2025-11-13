return {
  "nvimtools/none-ls.nvim",
  dependencies = {
    "nvimtools/none-ls-extras.nvim",
  },
  config = function()
    local null_ls = require("null-ls")
    null_ls.setup({
      sources = {
        null_ls.builtins.diagnostics.actionlint,
        null_ls.builtins.diagnostics.ansiblelint,
        null_ls.builtins.diagnostics.opentofu_validate,
        null_ls.builtins.diagnostics.yamllint,
        null_ls.builtins.formatting.hclfmt,
        null_ls.builtins.formatting.opentofu_fmt,
        null_ls.builtins.formatting.packer,
        null_ls.builtins.formatting.shfmt,
        null_ls.builtins.formatting.stylua,
        require("none-ls.diagnostics.flake8"),
        require("none-ls.formatting.autopep8"),
        require("none-ls.formatting.tex_fmt"),
      },
    })
  end,
}
