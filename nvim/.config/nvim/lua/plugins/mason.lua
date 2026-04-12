vim.pack.add({
  { src = "https://github.com/mason-org/mason.nvim" },
  { src = "https://github.com/mason-org/mason-lspconfig.nvim" },
  { src = "https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim" },
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
    "yamlls"
  },
})

require("mason-tool-installer").setup({
  ensure_installed = {
    "ansible-lint",
    "hclfmt",
    "shfmt",
    "stylua",
    "systemdlint",
    "tflint",
    "tfsec",
    "tex-fmt",
  },
  auto_update = true,
  run_on_start = true,
  integrations = {
    ['mason-lspconfig'] = false,
    ['mason-null-ls'] = true,
    ['mason-nvim-dap'] = true,
  },
})

vim.cmd("MasonUpdate")
