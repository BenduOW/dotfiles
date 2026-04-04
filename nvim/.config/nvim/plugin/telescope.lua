--vim.pack.add{
--    { src = 'https://github.com/nvim-telescope/telescope.nvim' },
--}

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<C-p>', builtin.git_files, { desc = 'Telescope git search' })
vim.keymap.set('n', '<leader>fg', function()
    builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)
