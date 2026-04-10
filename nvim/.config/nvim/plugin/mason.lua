vim.pack.add({
  { src = "https://github.com/mason-org/mason.nvim" },
  { src = "https://github.com/mason-org/mason-lspconfig.nvim" },
  { src = "https://github.com/jay-babu/mason-null-ls.nvim" },
})

require("mason").setup()
require("mason-lspconfig").setup({
  ensure_installed = {
    "ansiblels",
    "bashls",
    "docker_language_server",
    "gitlab_ci_ls",
    "gh_actions_ls",
    "jsonls",
    "ltex_plus",
    "lua_ls",
    "pylsp",
    "terraformls",
  },
})

require("mason-null-ls").setup({
  ensure_installed = {
    "ansible-lint",
    "hclfmt",
    "shfmt",
    "stylua",
    "tflint",
    "tfsec",
    "tex_fmt",
  },
  automatic_installation = false,
  handlers = {},
})

vim.cmd("MasonUpdate")
