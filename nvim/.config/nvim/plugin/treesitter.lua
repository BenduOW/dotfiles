vim.pack.add{
  {
    src = 'https://github.com/nvim-treesitter/nvim-treesitter',
    version = 'main',
    build = ':TSUpdate',
  },
}

require('nvim-treesitter').install({
    'lua',
    'python',
})

--require('nvim-treesitter.config').setup({
--  ensure_installed = {
--    "lua",
--    "python",
--  },
--  sync_install = false,
--  auto_install = true,
--  highlight = {
--    enable = true,
--    additional_vim_regex_highlighting = false,
--  },
--})
