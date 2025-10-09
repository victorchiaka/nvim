return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua,
				null_ls.builtins.formatting.prettierd,
				-- null_ls.builtins.formatting.eslint_d,
			},
		})

		-- CONFIGURATION: Change this to switch between modes
		local USE_VIRTUAL_TEXT = false -- Set to true for virtual text, false for floating window

		local diagnostic_ns = vim.api.nvim_create_namespace("cursor_line_diagnostics")

		-- Set up autocommands for cursor movement
		vim.api.nvim_create_augroup("LineDiagnostics", { clear = true })

		if USE_VIRTUAL_TEXT then
			-- Virtual text mode: Show inline text on cursor line
			vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
				group = "LineDiagnostics",
				callback = function()
					local bufnr = vim.api.nvim_get_current_buf()
					local line = vim.fn.line(".") - 1

					-- Clear only our diagnostic namespace
					vim.api.nvim_buf_clear_namespace(bufnr, diagnostic_ns, 0, -1)

					-- Get diagnostics for current line
					local line_diagnostics = vim.diagnostic.get(bufnr, { lnum = line })

					if #line_diagnostics > 0 then
						for _, diagnostic in ipairs(line_diagnostics) do
							local hl_group = "DiagnosticVirtualTextError" -- Default to error
							if diagnostic.severity == vim.diagnostic.severity.WARN then
								hl_group = "DiagnosticVirtualTextWarn"
							elseif diagnostic.severity == vim.diagnostic.severity.INFO then
								hl_group = "DiagnosticVirtualTextInfo"
							elseif diagnostic.severity == vim.diagnostic.severity.HINT then
								hl_group = "DiagnosticVirtualTextHint"
							end

							vim.api.nvim_buf_set_extmark(bufnr, diagnostic_ns, line, -1, {
								virt_text = { { "● " .. diagnostic.message, hl_group } },
								virt_text_pos = "eol",
							})
						end
					end
				end,
			})
		else
			-- Floating window mode: Show popup on cursor movement
			local float_win_id = nil

			vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
				group = "LineDiagnostics",
				callback = function()
					-- Close existing float if it exists
					if float_win_id and vim.api.nvim_win_is_valid(float_win_id) then
						vim.api.nvim_win_close(float_win_id, true)
						float_win_id = nil
					end

					local line = vim.fn.line(".") - 1
					local line_diagnostics = vim.diagnostic.get(0, { lnum = line })

					if #line_diagnostics > 0 then
						-- Small delay to prevent flicker
						vim.defer_fn(function()
							if vim.fn.line(".") - 1 == line then -- Only show if cursor is still on same line
								local float_opts = {
									focusable = false,
									close_events = { "CursorMoved", "CursorMovedI", "BufHidden", "InsertCharPre" },
									border = "rounded",
									source = "always",
									prefix = "● ",
									scope = "cursor",
								}
								local _, win_id = vim.diagnostic.open_float(nil, float_opts)
								if win_id then
									float_win_id = win_id
								end
							end
						end, 200) -- 100ms delay
					end
				end,
			})
		end
	end,
}
