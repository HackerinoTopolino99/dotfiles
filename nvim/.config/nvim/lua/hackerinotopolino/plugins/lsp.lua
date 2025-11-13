return {
  "neovim/nvim-lspconfig",
  config = function()
    local cmp_lsp = require("cmp_nvim_lsp")
    local capabilities = vim.tbl_deep_extend(
      "force",
      {},
      vim.lsp.protocol.make_client_capabilities(),
      cmp_lsp.default_capabilities()
    )

    vim.lsp.config('*', {
      capabilities = capabilities
    })

    vim.lsp.config.ansiblels = {
      filetypes = { "yaml" },
      root_markers = {
        "ansible.cfg",
        "inventory",
        "inventory.yml",
        "inventory.example",
        "inventory.yml.example",
        "site.yml",
        "main.yml"
      },
      single_file_support = false,
    }

    vim.lsp.config.gitlab_ci_ls = {
      single_file_support = false
    }

    vim.lsp.config.gh_actions_ls = {
      filetypes = { "yaml.github" },
      root_markers = {".github/workflows"},
      single_file_support = false,
    }

    vim.lsp.config.jsonls = {}

    vim.lsp.config.ltex_plus = {
      settings = {
        ltex = {
          language = "it-IT",
        },
      },
    }

    vim.lsp.config.lemminx = {
      filetypes = { "xml" },
      single_file_support = true,
    }

    vim.lsp.config.pyright = {
      filetypes = { "python" },
      root_markers = {
        "requirements.txt",
        "pyproject.toml",
        "setup.py",
        "setup.cfg",
        "Pipfile",
        "pyrightconfig.json"
      },
      single_file_support = true,
      settings = {
        python = {
          analysis = {
            diagnosticMode = "workspace",
          },
          venvPath = "./.venv",
        },
      },
    }

    vim.lsp.config.yamlls = {
      filetypes = { "yaml" },
      single_file_support = true,
    }

    vim.diagnostic.config({
      update_in_insert = true,
      virtual_text = true,
      signs = true,
    })
  end,
}
