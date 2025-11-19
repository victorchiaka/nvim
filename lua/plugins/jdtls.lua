return {
	{
		"mfussenegger/nvim-jdtls",
		ft = "java",
		config = function()
			-- Create an autocommand that only runs for Java files
			vim.api.nvim_create_autocmd("FileType", {
				pattern = "java",
				callback = function()
					local home = os.getenv("HOME")
					local workspace_path = home .. "/.local/share/nvim/jdtls-workspace/"
					local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")
					local workspace_dir = workspace_path .. project_name

					local status, jdtls = pcall(require, "jdtls")
					if not status then
						vim.notify("JDTLS not available", vim.log.levels.WARN)
						return
					end

					-- Ensure workspace directory exists
					vim.fn.mkdir(workspace_dir, "p")

					local extendedClientCapabilities = jdtls.extendedClientCapabilities

					local config = {
						cmd = {
							"java",
							"-Declipse.application=org.eclipse.jdt.ls.core.id1",
							"-Dosgi.bundles.defaultStartLevel=4",
							"-Declipse.product=org.eclipse.jdt.ls.core.product",
							"-Dlog.protocol=true",
							"-Dlog.level=ALL",
							"-Xmx1g",
							"--add-modules=ALL-SYSTEM",
							"--add-opens",
							"java.base/java.util=ALL-UNNAMED",
							"--add-opens",
							"java.base/java.lang=ALL-UNNAMED",
							"-javaagent:" .. home .. "/.local/share/nvim/mason/packages/jdtls/lombok.jar",
							"-jar",
							vim.fn.glob(
								home
									.. "/.local/share/nvim/mason/packages/jdtls/plugins/org.eclipse.equinox.launcher_*.jar"
							),
							"-configuration",
							home .. "/.local/share/nvim/mason/packages/jdtls/config_linux",
							"-data",
							workspace_dir,
						},
						root_dir = require("jdtls.setup").find_root({
							".git",
							"mvnw",
							"gradlew",
							"pom.xml",
							"build.gradle",
						}),
						settings = {
							java = {
								signatureHelp = { enabled = true },
								extendedClientCapabilities = extendedClientCapabilities,
								maven = {
									downloadSources = true,
								},
								referencesCodeLens = {
									enabled = true,
								},
								references = {
									includeDecompiledSources = true,
								},
								inlayHints = {
									parameterNames = {
										enabled = "all",
									},
								},
								format = {
									enabled = false,
								},
							},
						},
						init_options = {
							bundles = {},
						},
					}

					require("jdtls").start_or_attach(config)

					-- Set up keymaps only for Java buffers
					local opts = { buffer = true }
					vim.keymap.set(
						"n",
						"<leader>co",
						"<Cmd>lua require'jdtls'.organize_imports()<CR>",
						vim.tbl_extend("force", opts, { desc = "Organize Imports" })
					)
					vim.keymap.set(
						"n",
						"<leader>ev",
						"<Cmd>lua require('jdtls').extract_variable()<CR>",
						vim.tbl_extend("force", opts, { desc = "Extract Variable" })
					)
					vim.keymap.set(
						"v",
						"<leader>crv",
						"<Esc><Cmd>lua require('jdtls').extract_variable(true)<CR>",
						vim.tbl_extend("force", opts, { desc = "Extract Variable" })
					)
					vim.keymap.set(
						"n",
						"<leader>evv",
						"<Cmd>lua require('jdtls').extract_constant()<CR>",
						vim.tbl_extend("force", opts, { desc = "Extract Constant" })
					)
					vim.keymap.set(
						"v",
						"<leader>ec",
						"<Esc><Cmd>lua require('jdtls').extract_constant(true)<CR>",
						vim.tbl_extend("force", opts, { desc = "Extract Constant" })
					)
					vim.keymap.set(
						"v",
						"<leader>em",
						"<Esc><Cmd>lua require('jdtls').extract_method(true)<CR>",
						vim.tbl_extend("force", opts, { desc = "Extract Method" })
					)
				end,
			})
		end,
	},
}
