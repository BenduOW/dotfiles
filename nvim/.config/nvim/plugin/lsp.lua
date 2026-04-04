--vim.pack.add{
--  { src = 'https://github.com/mason-org/mason.nvim' },
--  { src = 'https://github.com/neovim/nvim-lspconfig' },
--  { src = 'https://github.com/mason-org/mason-lspconfig.nvim' },
--}

require("mason").setup({})
require("mason-lspconfig").setup({
    ensure_installed = {
        "lua_ls",
    },
--    automatic_enable = {
--        "lua_ls",
--    },
})

vim.lsp.config["*"] = {
	capabilities = require("blink.cmp").get_lsp_capabilities(),
}

vim.lsp.config('lua_ls', {
    settings = {
        Lua = {
            runtime = {
                --tell language server which version of lua
                version = 'LuaJIT',
            },
            diagnostics = {
                --recognize 'vim' global
                globals = {
                    'vim',
                    'require',
                },
            },
            workspace = {
                -- make server aware of neovim runtime files
                library = vim.api.nvim_get_runtime_file("", true),
            },
            -- do not send telemetry data containing a randomized but unique identifier
            telemetry = {
                enable = false,
            },
        },
    },
})

-- TODO: nvim-lint conform.nvim
