return {
	{
		"mason-org/mason.nvim",
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
		dependencies = {
			"mason-org/mason.nvim",
			"neovim/nvim-lspconfig",
			"saghen/blink.cmp",
		},
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls",
					"html",
					"ts_ls",
					"cssls",
					"tailwindcss",
					"emmet_ls",
					"gopls",
					"prismals",
					"tailwindcss",
					"vue_ls"
				},
				automatic_installation = true,

				-- This block fixes the duplicate LSP client buffer attachment issue
				automatic_enable = {
					exclude = {
						"gopls",
						"lua_ls"
					}
				}
			})

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
			local capabilities = require("blink.cmp").get_lsp_capabilities()

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
					"typescriptreact",
					"javascriptreact",
					"typescript",
					"javascript",
					"svelte",
					"vue",
				},
			})

			lspconfig["html"].setup({
				capabilities = capabilities,
			})
		end,
	},
	{
		"saghen/blink.cmp",
		dependencies = { "rafamadriz/friendly-snippets" },
		version = "1.*",
		opts = {
			-- Custom keymap to match your nvim-cmp bindings
			keymap = {
				preset = "none",
				["<C-k>"] = { "select_prev", "fallback" },
				["<C-j>"] = { "select_next", "fallback" },
				["<C-b>"] = { "scroll_documentation_up", "fallback" },
				["<C-f>"] = { "scroll_documentation_down", "fallback" },
				["<C-Space>"] = { "show", "show_documentation", "hide_documentation" },
				["<C-e>"] = { "hide" },
				["<CR>"] = { "accept", "fallback" },
			},

			appearance = {
				nerd_font_variant = "mono",
			},

			-- Auto-trigger completion (similar to your nvim-cmp config)
			completion = {
				documentation = { auto_show = true, auto_show_delay_ms = 0 }, -- Trigger's as we type
				trigger = {
					prefetch_on_insert = true,
					show_on_insert_on_trigger_character = true,
				},
			},

			sources = {
				default = { "lsp", "path", "snippets", "buffer" },
			},

			fuzzy = { implementation = "prefer_rust_with_warning" },
		},
		opts_extend = { "sources.default" },
	},
}
