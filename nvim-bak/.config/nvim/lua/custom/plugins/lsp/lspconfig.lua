return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "folke/lazydev.nvim",
      ft = "lua", -- only load on lua files
      opts = {
        library = {
          -- See the configuration section for more details
          -- Load luvit types when the `vim.uv` word is found
          { path = "${3rd}/luv/library", words = { "vim%.uv" } },
        },
      },
    },
    lazy = false,
    config = function()
      local capabilities = require("blink.cmp").get_lsp_capabilities()

      vim.lsp.config("lua_ls", {
        capabilities = capabilities,
      })

      vim.lsp.config("pylsp", {
        capabilities = capabilities,
        settings = {
          pylsp = {
            plugins = {
              flake8 = { enabled = true },
              pycodestyle = {
                enabled = false,
                max_line_length = 79,
              },
              pyflakes = { enbaled = false },
              pylint = { enabled = false },
              mccabe = { enabled = false },
              autopep8 = { enabled = true },
            },
          },
        },
      })

      vim.lsp.config("qmlls", {
        --cmd = { "qmlls", "-E" },
      })

      vim.lsp.config("clangd", {
        capabilities = capabilities,
      })

      vim.lsp.config("jdtls", {
        settings = {
          java = {},
        },
      })

      vim.lsp.config("texlab", {})

      on_attach = function(client, bufnr)
        client.server_capabilities.signatureHelpProvider = false
        on_attach(client, bufnr)
      end
      --      require("lspconfig").pyright.setup({
      --        on_attach = on_attach,
      --        capabilities = capabilities,
      --        settings = {
      --          pyright = {
      --            disableOrganizeImports = true,
      --          },
      --          python = {
      --            analysis = {
      --              ignore = { "*" },
      --            },
      --          },
      --        },
      --        --filetypes = {"python"}
      --      })

      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
      vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, {})
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
    end,
  },
}
