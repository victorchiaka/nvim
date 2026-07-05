return {
	{
		"rebelot/kanagawa.nvim",
		config = function()
			local kanagawa = require("kanagawa")

			kanagawa.setup({
				compile = false,
				undercurl = true,
				commentStyle = { italic = true },
				functionStyle = {},
				keywordStyle = {},
				statementStyle = {},
				typeStyle = {},
				transparent = false,
				dimInactive = false,
				terminalColors = true,
				colors = { -- add/modify theme and palette colors
					palette = {},
					theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
				},
				overrides = function() -- add/modify highlight
					return {}
				end,
				theme = "lotus", -- Load "wave" theme - try "lotus" or "dragon"
				background = {
					dark = "wave",
					light = "lotus",
				},
			})
		end,
	},
}
