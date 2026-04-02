return {
--	{
--		"folke/tokyonight.nvim",
--		name = "tokyonight",
--		priority = 1000,
--        config = function ()
--        end,
--	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
        config = function ()
            vim.g.catppuccin_flavour = "mocha"
            vim.cmd([[colorscheme catppuccin]])
        end,
	},
--    {
--        "ellisonleao/gruvbox.nvim",
--        name = "gruvbox",
--        priority = 1000,
--        config = function ()
--            vim.o.background = "dark"
--            vim.cmd([[colorscheme gruvbox]])
--        end,
--    },
--  {
--		"rose-pine/neovim",
--		name = "rose-pine",
--		priority = 1000,
--	},
}
