return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim",
	},
	config = function()
		-- import mason
		local mason = require("mason")

		-- import mason-lspconfig
		local mason_lspconfig = require("mason-lspconfig")

		local mason_tool_installer = require("mason-tool-installer")

		-- enable mason and configure icons
		mason.setup({
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		})

		mason_lspconfig.setup({
			ensure_installed = {
				"emmet_ls",
				"graphql",
				"lua_ls",
				"tsserver",
				"pyright",
				"svelte",
				"volar",
				"astro",
				-- "java_language_server",
				-- "gopls",
				"cssls",
				"html",
				"markdown_oxide",
				"prismals",
				"somesass_ls",
				"taplo",
				"tailwindcss",
				"yamlls",
			},
			automatic_installation = true, -- nothing like ensure_installed
		})

		mason_tool_installer.setup({
			ensure_installed = {
				"prettier", -- prettier formatter
				"stylua", -- lua formatter
				"eslint_d",
				"ruff",
				"isort",
				"pylint",
			},
		})
	end,
}
