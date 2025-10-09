return {
	"akinsho/bufferline.nvim",
	version = "*",
	dependencies = "nvim-tree/nvim-web-devicons",
	enabled = true,
	config = function()
		vim.opt.termguicolors = true

		require("bufferline").setup({
			options = {
				mode = "buffers",
				buffer_close_icon = "󰅖 ",
				close_command = "bdelete %d",
				close_icon = "󰅖 ",
				-- close_icon = "",
				-- diagnostics = "nvim_lsp", -- Change to nvim_lsp if using native LSP
				indicator = {
					style = "icon",
					icon = "|",
				},
				left_trunc_marker = "",
				modified_icon = "●",
				offsets = {
					{
						filetype = "neo-tree",
						text = "EXPLORER",
						text_align = "center",
						separator = true,
					},
				},
				right_mouse_command = "bdelete! %d",
				right_trunc_marker = "",
				show_close_icon = true,
				show_buffer_close_icons = true,
				show_tab_indicators = true,
				diagnostics_indicator = function(count, level, diagnostics_dict, context)
					local icon = level:match("error") and " " or " "
					return " " .. icon .. count
				end,
			},
			highlights = {
				-- Background fill (empty space)
				fill = {
					fg = "#3c3836",
					bg = "#1d2021",
				},

				-- Inactive buffers (dark gray background, white text)
				background = {
					fg = "#ebdbb2", -- white text
					bg = "#3c3836", -- dark gray background
				},

				-- Visible buffer (in another window)
				buffer_visible = {
					fg = "#ebdbb2",
					bg = "#3c3836",
				},

				-- Active/Selected buffer (black background, white text)
				buffer_selected = {
					fg = "#ebdbb2", -- white text
					bg = "#000000", -- black background
					bold = true,
					italic = false,
				},

				-- Modified indicator for inactive buffers
				modified = {
					fg = "#fabd2f",
					bg = "#3c3836",
				},

				-- Modified indicator for active buffer
				modified_selected = {
					fg = "#fabd2f",
					bg = "#000000",
				},

				-- Modified indicator for visible buffer
				modified_visible = {
					fg = "#fabd2f",
					bg = "#3c3836",
				},

				-- Separators
				separator = {
					fg = "#1d2021",
					bg = "#3c3836",
				},
				separator_selected = {
					fg = "#1d2021",
					bg = "#000000",
				},
				separator_visible = {
					fg = "#1d2021",
					bg = "#3c3836",
				},

				-- Close buttons
				close_button = {
					fg = "#ebdbb2",
					bg = "#3c3836",
				},
				close_button_selected = {
					fg = "#ebdbb2",
					bg = "#000000",
				},
				close_button_visible = {
					fg = "#ebdbb2",
					bg = "#3c3836",
				},

				-- Duplicate file names (when same filename in different dirs)
				duplicate = {
					fg = "#a89984",
					bg = "#3c3836",
					italic = true,
				},
				duplicate_selected = {
					fg = "#ebdbb2",
					bg = "#000000",
					italic = true,
				},
				duplicate_visible = {
					fg = "#a89984",
					bg = "#3c3836",
					italic = true,
				},

				-- Diagnostics
				error = {
					fg = "#fb4934",
					bg = "#3c3836",
				},
				error_selected = {
					fg = "#fb4934",
					bg = "#000000",
				},
				warning = {
					fg = "#fabd2f",
					bg = "#3c3836",
				},
				warning_selected = {
					fg = "#fabd2f",
					bg = "#000000",
				},
				info = {
					fg = "#83a598",
					bg = "#3c3836",
				},
				info_selected = {
					fg = "#83a598",
					bg = "#000000",
				},
			},
		})
	end,
}
