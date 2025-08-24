return {
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			-- setup gitsigns with default properties
			require("gitsigns").setup({})
		end,
	},
	{
		"tpope/vim-fugitive",
		config = function() end,
	},
}
