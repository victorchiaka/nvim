return {
	"numToStr/Comment.nvim",
	opts = {
		-- add any options here
	},

	dependencies = {
		-- plugin to allow us to automatically comment tsx elements with the comment plugin
		"JoosepAlviste/nvim-ts-context-commentstring",
	},

	lazy = false,
	config = function()
		-- setup the comment plugin to use ts_context_comment_string to check if we are attempting to comment out a tsx element
		local ts_context_comment_string = require("ts_context_commentstring.integrations.comment_nvim")

		require("Comment").setup({
			pre_hook = ts_context_comment_string.create_pre_hook(),
		})
	end,
}
