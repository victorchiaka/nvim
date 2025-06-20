return {
	{
		"nvim-telescope/telescope.nvim",
		branch = "0.1.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			{
				"nvim-telescope/telescope-fzf-native.nvim",
				build = "make",
			},
			"nvim-tree/nvim-web-devicons",
		},
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		config = function()
			local actions = require("telescope.actions")
			local telescope = require("telescope")

			telescope.setup({
				defaults = {
					mappings = {
						i = {
							["<C-k>"] = actions.move_selection_previous, -- Move to prev result
							["<C-j>"] = actions.move_selection_next, -- Move to next result
							["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist, -- Quick fix list
						},
					},
				},
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({
							-- even more opts
						}),
					},
				},
			})
			telescope.load_extension("ui-select")

			-- Setup noice.nvim telescope feature
			telescope.load_extension("noice")
		end,
	},
}
