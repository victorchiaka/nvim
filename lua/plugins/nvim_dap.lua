local keymap = vim.keymap

return {
	{
		"mfussenegger/nvim-dap-python",
		filetype = "python",
		config = function()
			local PATH = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python" -- Change this to the path for your debugpy installation
			require("dap-python").setup(PATH)
		end,
	},

	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"rcarriga/nvim-dap-ui",
			"nvim-neotest/nvim-nio",
		},
		config = function()
			local dap, dapui = require("dap"), require("dapui")

			require("dapui").setup()

			dap.listeners.before.attach.dapui_config = function()
				dapui.open()
			end
			dap.listeners.before.launch.dapui_config = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated.dapui_config = function()
				dapui.close()
			end
			dap.listeners.before.event_exited.dapui_config = function()
				dapui.close()
			end

			-- To toggle debugger breakpoint
			keymap.set("n", "<Leader>db", dap.toggle_breakpoint, {})
			keymap.set("n", "<leader>dt", dap.continue, {})

			-- Set Debug actions
			keymap.set("n", "<leader>q", dap.step_over, {})
			keymap.set("n", "<leader>w", dap.step_into, {})
			keymap.set("n", "<leader>e", dap.step_out, {})
			keymap.set("n", "<leader>dr", ":lua require('dapui').open({reset = true})<ENTER>", { noremap = true })
		end,
	},
}
