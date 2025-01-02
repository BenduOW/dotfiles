return {
	{
		"folke/tokyonight.nvim",
		name = "tokyonight",
		priority = 1000,
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
    config = function ()
      vim.g.catppuccin_flavour = "mocha"
      vim.cmd([[colorscheme catppuccin]])
    end,
	},
	{
		"rose-pine/neovim",
		name = "rose-pine",
		priority = 1000,
	},
}
