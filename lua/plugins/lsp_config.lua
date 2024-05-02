local keymap = vim.keymap
local buf = vim.lsp.buf -- To set lsp buffers

return {
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
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
			})
		end,
	},
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities
			local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup({
				capabilities = capabilities,
			})
			lspconfig.tsserver.setup({
				capabilities = capabilities,
			})
			lspconfig.pyright.setup({
				capabilities = capabilities,
			})
			lspconfig.svelte.setup({
				capabilities = capabilities,
			})
			lspconfig.volar.setup({
				capabilities = capabilities,
			})
			lspconfig.astro.setup({
				capabilities = capabilities,
			})
			-- lspconfig.java_language_server.setup({ capabilities = capabilities })
			-- lspconfig.gopls.setup({ capabilities = capabilities })
			lspconfig.cssls.setup({
				capabilities = capabilities,
			})
			lspconfig.html.setup({
				capabilities = capabilities,
			})
			lspconfig.markdown_oxide.setup({
				capabilities = capabilities,
			}) -- For markdown
			lspconfig.prismals.setup({
				capabilities = capabilities,
			}) -- For prisma ORM
			lspconfig.somesass_ls.setup({
				capabilities = capabilities,
			})
			lspconfig.taplo.setup({
				capabilities = capabilities,
			})
			lspconfig.tailwindcss.setup({
				capabilities = capabilities,
			})
			lspconfig.yamlls.setup({
				capabilities = capabilities,
			})

			-- Lsp buffer keybinding
			keymap.set("n", "K", buf.hover, {}) -- K = SHIFT+k
			keymap.set("n", "gd", buf.definition, {}) -- Go to definition
			keymap.set("n", "<leader>ca", buf.code_action, {})
		end,
	},
}
