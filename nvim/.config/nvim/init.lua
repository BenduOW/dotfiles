vim.opt.tabstop = 4 -- tabwidth vim.opt.shiftwidth = 4 -- indent width vim.opt.softtabstop = 4 -- soft tab stop not tabs on tab/backspace vim.opt.expandtab = true -- use spaces instead of tabs
vim.opt.smartindent = true -- smart auto-indent
vim.opt.autoindent = true -- copy indent from current line
vim.opt.swapfile = false
vim.opt.ignorecase = true
vim.opt.smartcase = true


vim.g.mapleader = " "
--vim.g.maplocalleader = "\\"

vim.opt.clipboard = "unnamedplus"
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.termguicolors = true
vim.opt.colorcolumn = "100"

vim.keymap.set("n", "<space><space>x", "<cmd>source %<CR>")
vim.keymap.set("n", "<space>x", ":.lua<CR>")
vim.keymap.set("v", "<space>x", ":lua<CR>")

vim.keymap.set("i", "jk", "<esc>", { desc = "Exit insert mode" })

-- quickfix
vim.keymap.set("n", "<M-j>", "<cmd>cnext<CR>")
vim.keymap.set("n", "<M-k>", "<cmd>cprev<CR>")

--switch lines
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight when yanking (copying) text",
  group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

--vim.keymap.set("n", "-", "<cmd>Oil<CR>")


vim.pack.add({

    --colorschme
    { src = 'https://github.com/dchinmay2/alabaster.nvim' },
		-- oil
		{ src = 'https://github.com/nvim-tree/nvim-web-devicons' },
		{ src = 'https://github.com/stevearc/oil.nvim' },
    --harpoon
    { src = 'https://github.com/nvim-lua/plenary.nvim' },
    { src = 'https://github.com/theprimeagen/harpoon' },
    --telescope
    { src = 'https://github.com/nvim-telescope/telescope.nvim' },
    --undotree
    { src = 'https://github.com/mbbill/undotree' },
    --treesitter
    {
      src = 'https://github.com/nvim-treesitter/nvim-treesitter',
      version = 'main',
      build = ':TSUpdate',
    },
    --lsp
    { src = 'https://github.com/mason-org/mason.nvim' },
    { src = 'https://github.com/neovim/nvim-lspconfig' },
    { src = 'https://github.com/mason-org/mason-lspconfig.nvim' },
    -- completion
    {
      src = 'https://github.com/saghen/blink.cmp',
      version = vim.version.range("1.*"),
    },
    {
      src = 'https://github.com/L3MON4D3/LuaSnip',
      version = "v2.4.1",
    },

})
