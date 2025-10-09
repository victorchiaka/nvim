return {
	"michaelrommel/nvim-silicon",
	lazy = true,
	cmd = "Silicon",
	keys = {
		{
			"<leader>cc",
			function()
				require("nvim-silicon").clip()
			end,
			mode = "v",
			desc = "Copy screenshot to clipboard",
		},
		{
			"<leader>cs",
			function()
				require("nvim-silicon").file()
			end,
			mode = "v",
			desc = "Save screenshot",
		},
	},
	config = function()
		require("nvim-silicon").setup({
			-- Font settings
			font = "JetBrains Mono=24",

			-- Theme: VSCode Dark+ style
			theme = "Visual Studio Dark+",

			-- Background color
			background = "#95a1aa",

			-- Padding
			pad_horiz = 100,
			pad_vert = 80,

			-- No shadow
			shadow_blur_radius = 0,
			shadow_offset_x = 0,
			shadow_offset_y = 0,
			shadow_color = "#00000000",

			-- Hide line numbers
			no_line_number = true,

			-- Output file settings
			output = function()
				return vim.fn.expand("~/Pictures/") .. "code_" .. os.date("%Y%m%d_%H%M%S") .. ".png"
			end,

			window_title = function()
				return vim.fn.fnamemodify(vim.api.nvim_buf_get_name(0), ":t")
			end,

			-- Tab width
			tab_width = 2,
		})
	end,
}
