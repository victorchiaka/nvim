return {
	"folke/noice.nvim",
	event = "VeryLazy",
	opts = {
		routes = {
			{
				filter = {
					event = "msg_show",
					any = {
						{ find = "sign_define.*deprecated" },
						{ find = "vim%.fn%.sign_define.*deprecated" },
					},
				},
				opts = { skip = true },
			},
		},
		-- add any other options here
	},
	dependencies = {
		"MunifTanjim/nui.nvim",
		-- nvim-notify for those toast notification
		"rcarriga/nvim-notify",
	}
}
