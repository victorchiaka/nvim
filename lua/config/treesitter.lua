local treesitter = require("nvim-treesitter")

local langs = {
	"c", "lua", "html", "javascript", "jsx", "python", "typescript", "tsx",
	"java", "vue", "css", "scss", "json", "markdown", "markdown_inline",
	"bash", "svelte", "vim", "cpp", "prisma", "go",
}

treesitter.setup({
	install_dir = vim.fn.stdpath("data") .. "/site",
})

treesitter.install(langs)

vim.api.nvim_create_autocmd("FileType", {
	pattern = langs,
	callback = function()
		if pcall(vim.treesitter.start) then
			vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
		end
	end,
})
