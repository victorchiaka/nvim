-- To work with this none-ls since null-ls github repo is archived
-- set this up and add your other formatters here
-- Then use the :Mason command to open the Mason GUI, Navigate to Formatters, /<formatter_name>, and "i" to install the formatter
-- Then restart nvim and you're good to go

return {
	"nvimtools/none-ls.nvim",
	config = function()
		local null_ls = require("null-ls")
		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua,
			},
		})
		vim.keymap.set("n", "<leader>v", vim.lsp.buf.format, {}) -- Formatting file using any formatter within the builtins
	end,
}
