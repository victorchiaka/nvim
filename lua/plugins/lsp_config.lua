local keymap = vim.keymap
local buf = vim.lsp.buf -- To set lsp buffers

return {

	{
		"mfussenegger/nvim-jdtls",
		dependencies = {
			"nvim-java/lua-async-await",
			"nvim-java/nvim-java-refactor",
			"nvim-java/nvim-java-core",
			"nvim-java/nvim-java-test",
			"nvim-java/nvim-java-dap",
			"MunifTanjim/nui.nvim",
			"neovim/nvim-lspconfig",
			"mfussenegger/nvim-dap",
			{
				"williamboman/mason.nvim",
				opts = {
					registries = {
						"github:nvim-java/mason-registry",
						"github:mason-org/mason-registry",
					},
				},
			},
		},
	},
	{
		"neovim/nvim-lspconfig",
		event = {
			"BufReadPre",
			"BufNewFile",
		},
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-cmdline",
			{ "antosha417/nvim-lsp-file-operations", config = true },
			{ "folke/neodev.nvim",                   opts = {} },
		},
		lazy = false,

		config = function()
			local opts = { noremap = true, silent = true }

			local on_attach = function(client, bufnr)
				opts.buffer = bufnr

				-- Lsp buffer keybinding
				opts.desc = "Hover: - Show property information"
				keymap.set("n", "K", buf.hover, opts) -- K = SHIFT+k

				opts.desc = "Go to definition"
				keymap.set("n", "gd", buf.definition, opts) -- Go to definition

				opts.desc = "Show LSP description"
				keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp definitions

				opts.desc = "Go to declaration"
				keymap.set("n", "<leader>d", buf.declaration, opts) -- Go to declaration

				opts.desc = "Show all references"
				keymap.set("n", "gr", buf.references, opts) -- Show all references

				-- opts.desc = "Shows the list of completion options" -- VERY IMPORTANT
				-- keymap.set("i", "C-l", buf.completion, opts) -- Brings up the list of suggestion options

				opts.desc = "Show code action"
				keymap.set("n", "<leader>ca", buf.code_action, opts) -- Show code code_action

				opts.desc = "Smart rename"
				keymap.set("n", "<leader>rn", buf.rename, opts) -- Smart rename file

				opts.desc = "Restart LSP"
				keymap.set("n", "<leader>rs", ":LspRestart<ENTER>", opts) -- mapping to restart lsp if necessary
			end

			local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }

			for type, icon in pairs(signs) do
				local hl = "DiagnosticSign" .. type
				vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
			end

			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lspconfig = require("lspconfig")
			lspconfig.lua_ls.setup({
				capabilities = capabilities,
				on_attach = on_attach,
				settings = {
					Lua = {
						-- make the language server recognize "vim" global
						diagnostics = {
							globals = { "vim" },
						},
						completion = {
							callSnippet = "Replace",
						},
					},
				},
			})

			-- Setup command completion
			local cmp = require("cmp")
			-- `/` cmdline setup.
			cmp.setup.cmdline("/", {
				mapping = cmp.mapping.preset.cmdline(),
				sources = {
					{ name = "buffer" },
				},
			})

			-- `:` cmdline setup.
			cmp.setup.cmdline(":", {
				mapping = cmp.mapping.preset.cmdline(),
				sources = cmp.config.sources({
					{ name = "path" },
				}, {
					{
						name = "cmdline",
						option = {
							ignore_cmds = { "Man", "!" },
						},
					},
				}),
			})

			lspconfig.tsserver.setup({
				capabilities = capabilities,
				on_attach = on_attach,
				filetypes = {
					"javascript",
					"javascriptreact",
					"javascript.jsx",
					"typescript",
					"typescript.tsx",
					"typescriptreact",
					"vue",
					"svelte",
				},
			})

			lspconfig.pyright.setup({
				capabilities = capabilities,
				on_attach = on_attach,
				filetypes = { "python" },
			})
			lspconfig.ruff_lsp.setup({
				capabilities = capabilities,
				on_attach = on_attach,
				filetypes = { "python" },
			})

			lspconfig.svelte.setup({
				capabilities = capabilities,
				on_attach = function(client, bufnr)
					vim.api.nvim_create_autocmd("BufWritePost", {
						pattern = { "*.js", "*.ts" },
						callback = function(ctx)
							-- Here use ctx.match instead of ctx.file
							client.notify("$/onDidChangeTsOrJsFile", { uri = ctx.match })
						end,
					})
				end,
			})
			lspconfig.volar.setup({
				capabilities = capabilities,
				on_attach = on_attach,
				filetypes = { "vue" },
			})
			lspconfig.astro.setup({
				capabilities = capabilities,
				on_attach = on_attach,
			})

			-- For java development
			lspconfig.jdtls.setup({
				capabilities = capabilities,
				on_attach = on_attach,
				settings = {
					java = {
						configuration = {
							runtimes = {
								{
									name = "JavaSE-21",
									path = "/usr/lib/jvm/jdk-21-0-3/",
									default = true,
								},
							},
						},
					},
				},
			})

			-- lspconfig.gopls.setup({ capabilities = capabilities, on_attach = on_attach, })
			lspconfig.cssls.setup({
				capabilities = capabilities,
				on_attach = on_attach,
			})
			lspconfig.html.setup({
				capabilities = capabilities,
				on_attach = on_attach,
			})
			lspconfig.markdown_oxide.setup({
				capabilities = capabilities,
				on_attach = on_attach,
			}) -- For markdown
			lspconfig.prismals.setup({
				capabilities = capabilities,
				on_attach = on_attach,
			}) -- For prisma ORM
			lspconfig.somesass_ls.setup({
				capabilities = capabilities,
				on_attach = on_attach,
			})
			lspconfig.taplo.setup({
				capabilities = capabilities,
				on_attach = on_attach,
			})
			lspconfig.tailwindcss.setup({
				capabilities = capabilities,
				on_attach = on_attach,
			})
			lspconfig.yamlls.setup({
				capabilities = capabilities,
				on_attach = on_attach,
			})
			lspconfig.emmet_ls.setup({
				capabilities = capabilities,
				on_attach = on_attach,
				filetypes = {
					"html",
					"typescriptreact",
					"javascriptreact",
					"css",
					"sass",
					"vue",
					"scss",
					"less",
					"svelte",
				},
			})
		end,
	},
}
