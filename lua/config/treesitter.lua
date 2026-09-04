local treesitter = require("nvim-treesitter")
local langs = {
	"c", "lua", "html", "javascript", "jsx", "python", "typescript", "tsx",
	"java", "vue", "css", "scss", "json", "markdown", "markdown_inline",
	"bash", "svelte", "vim", "cpp", "prisma", "go",
}

treesitter.setup({
	install_dir = vim.fn.stdpath("data") .. "/site",
})

-- generic: run `action` on each lang one at a time, notifying as it goes
local function run_sequential(action_name, action_fn, lang_list, on_done)
	local function step(i)
		local lang = lang_list[i]
		if not lang then
			vim.notify(
				action_name .. " complete",
				vim.log.levels.INFO,
				{ title = "nvim-treesitter" }
			)
			if on_done then on_done() end
			return
		end
		action_fn(lang):await(function(err)
			if err then
				vim.notify(
					"Failed to " .. action_name:lower() .. " " .. lang .. ": " .. tostring(err),
					vim.log.levels.ERROR, { title = "nvim-treesitter" }
				)
			else
				if action_name == "Install" then
					vim.notify(lang .. " parser installed", vim.log.levels.INFO, { title = "nvim-treesitter" })
				else
					vim.notify(lang .. " " .. action_name:lower() .. "d", vim.log.levels.INFO,
						{ title = "nvim-treesitter" })
				end
			end
			step(i + 1)
		end)
	end
	step(1)
end

local installed = treesitter.get_installed()
local to_install = vim.iter(langs)
	:filter(function(lang) return not vim.tbl_contains(installed, lang) end)
	:totable()

if #to_install > 0 then
	vim.notify("Installing: " .. table.concat(to_install, ", "), vim.log.levels.INFO, { title = "nvim-treesitter" })
	run_sequential("Install", function(lang) return treesitter.install({ lang }) end, to_install)
end

vim.api.nvim_create_user_command("TSUpdateAll", function()
	local all_installed = treesitter.get_installed()
	vim.notify("Updating: " .. table.concat(all_installed, ", "), vim.log.levels.INFO, { title = "nvim-treesitter" })
	run_sequential("Update", function(lang) return treesitter.update({ lang }) end, all_installed)
end, {})

vim.api.nvim_create_user_command("TSUninstallNotify", function(opts)
	local targets = opts.fargs
	vim.notify("Uninstalling: " .. table.concat(targets, ", "), vim.log.levels.INFO, { title = "nvim-treesitter" })
	run_sequential("Uninstall", function(lang) return treesitter.uninstall({ lang }) end, targets)
end, { nargs = "+" })

vim.api.nvim_create_autocmd("FileType", {
	pattern = langs,
	callback = function()
		vim.treesitter.start()
		vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
	end,
})
