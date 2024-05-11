local keymap = vim.keymap
local buf = vim.lsp.buf -- To set lsp buffers

return {
	{
		"neovim/nvim-lspconfig",
		event = {
			"BufReadPre",
			"BufNewFile",
		},
		dependencies = {
			"hrsh7th/cmp-nvim-lsp",
			{ "antosha417/nvim-lsp-file-operations", config = true },
			{ "folke/neodev.nvim", opts = {} },
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

				opts.desc = "Show code action"
				keymap.set("n", "<leader>ca", buf.code_action, opts) -- Show code code_action

				opts.desc = "Smart rename"
				keymap.set("n", "<leader>rn", buf.rename, opts) -- Smart rename file

				opts.desc = "Go to declaration"
				keymap.set("n", "<leader>d", buf.declaration, opts) -- Go to declaration

				opts.desc = "Restart LSP"
				keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary
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

			lspconfig.tsserver.setup({
				capabilities = capabilities,
				on_attach = on_attach,
			})
			lspconfig.pyright.setup({
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
			})
			lspconfig.astro.setup({
				capabilities = capabilities,
				on_attach = on_attach,
			})
			-- lspconfig.java_language_server.setup({ capabilities = capabilities, on_attach = on_attach, })
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
