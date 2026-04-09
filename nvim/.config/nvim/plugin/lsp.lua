--vim.pack.add{
--  { src = 'https://github.com/mason-org/mason.nvim' },
--  { src = 'https://github.com/neovim/nvim-lspconfig' },
--  { src = 'https://github.com/mason-org/mason-lspconfig.nvim' },
--}

vim.cmd.packadd("nvim-lint")

-- LSP

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
vim.lsp.config("pyright", {})

-- Linting

--require('mason-tool-installer').setup({
--	ensure_installed = {
--		'luacheck',
--	},
--	auto_update = false,
--	run_on_start = true,
--	start_delay = 3000,
--	integrations = {
--		['mason-lspconfig'] = true,
--		['mason-null-ls'] = false,
--		['mason-nvim-dap'] = false,
--	},
--
--})
--
--local lint = require("lint")
--
--lint.linters_by_ft = {
--	lua = { "luacheck" },
--}
--
--vim.api.nvim_create_autocmd({ "BufReadPost", "BufWritePost", "InsertLeave" }, {
--    callback = function()
--        lint.try_lint()
--    end,
--})



-- Formatting
