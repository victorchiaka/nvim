return {
	{
		"mason-org/mason.nvim",
		tag = "v1.8.0",
		-- tag = "v1.3.0",
		config = function()
			require("mason").setup({
				ui = {
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗",
					},
				},
				ensure_installed = {
					"eslint_d",
					"stylua",
				},
			})
		end,
	},
	{
		"mason-org/mason-lspconfig.nvim",
		-- tag = "v1.3.0",
		dependencies = {
			"mason-org/mason.nvim",
			"neovim/nvim-lspconfig",
		},
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"html",
					"ts_ls",
					"cssls",
					"emmet_ls",
					"gopls",
					"prismals",
					"tailwindcss",
					"vue_ls",
				},
				automatic_installation = true,

				-- This block fixes the duplicate LSP client buffer attachment issue
				automatic_enable = {
					exclude = {
						"gopls",
						"lua_ls",
						"emmet_ls",
						"ts_ls",
						"vue_ls",
					},
				},
			})

			local cmp_nvim_lsp = require("cmp_nvim_lsp")

			local signs = {
				Error = "✘",
				Warn = "▲",
				Hint = "⚑",
				Info = "»",
			}

			-- Set up diagnostic signs (works with current Neovim versions)
			for type, icon in pairs(signs) do
				local hl = "DiagnosticSign" .. type
				vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
			end

			local lspconfig = require("lspconfig")
			local capabilities = cmp_nvim_lsp.default_capabilities()

			lspconfig["lua_ls"].setup({
				capabilities = capabilities,
				settings = {
					Lua = {
						diagnostics = {
							globals = { "vim" },
						},
						completion = {
							callSnippet = "Replace",
						},
					},
				},
			})

			lspconfig["emmet_ls"].setup({
				capabilities = capabilities,
			})

			lspconfig["gopls"].setup({
				capabilities = capabilities,
			})

			lspconfig["prismals"].setup({
				capabilities = capabilities,
			})

			lspconfig["tailwindcss"].setup({
				capabilities = capabilities,
			})

			local mason_registry = require("mason-registry")
			-- Vue support
			local vue_language_server_path = mason_registry.get_package("vue-language-server"):get_install_path()
				.. "/node_modules/@vue/language-server"

			lspconfig["ts_ls"].setup({
				init_options = {
					plugins = {
						{
							name = "@vue/typescript-plugin",
							location = vue_language_server_path,
							languages = { "vue" },
						},
					},
				},
				capabilities = capabilities,
				filetypes = {
					"typescript",
					"javascript",
					"typescriptreact",
					"javascriptreact",
					"svelte",
					"vue",
				},
			})

			lspconfig["html"].setup({
				capabilities = capabilities,
				filetypes = {
					"html",
					"vue",
				},
			})
		end,
	},
}
