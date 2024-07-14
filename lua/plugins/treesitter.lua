return {
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	config = function()
		local config = require("nvim-treesitter.configs")
		config.setup({
			ensure_installed = {
				"c",
				"lua",
				"html",
				"javascript",
				"python",
				"typescript",
				"java",
				"vue",
				"css",
				"scss",
				"tsx",
				"json",
				"markdown",
				"markdown_inline",
				"bash",
				"vim",
				"cpp",
				"dart",
				"prisma"
			},
			filetypes = {
				"html",
				"javascript",
				"typescript",
				"javascriptreact",
				"typescriptreact",
				"svelte",
				"vue",
				"tsx",
				"jsx",
				"rescript",
				"xml",
				"php",
				"markdown",
				"astro",
				"glimmer",
				"handlebars",
				"hbs",
				"dart",
				"prisma"
			},
			-- auto_install = true, -- To auto install parser for any language
			sync_install = true,
			highlight = { enable = true },
			indent = { enable = true },
		})
	end,
}
