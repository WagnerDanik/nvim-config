return {
	{
		"mfussenegger/nvim-dap",
		dependencies = {
			"rcarriga/nvim-dap-ui",
			"nvim-neotest/nvim-nio",
			"leoluz/nvim-dap-go",
		},
		config = function()
			local dap = require("dap")
			local ui = require("dapui")

			require("dapui").setup()
			require("dap-go").setup()

			dap.adapters.codelldb = {
				type = "server",
				port = "${port}",
				executable = {
					-- CHANGE THIS to your path!
					command = "/home/daniel/.local/share/nvim/mason/bin/codelldb",
					args = { "--port", "${port}" },

					-- On windows you may have to uncomment this:
					-- detached = false,
				},
			}
			dap.configurations.c = {
				{
					name = "Launch file",
					type = "codelldb",
					request = "launch",
					program = "${command:pickFile}",
					cwd = "${workspaceFolder}/out",
					stopOnEntry = false,
				},
			}

			-- Eval var under cursor
			vim.keymap.set("n", "<space>?", function()
				require("dapui").eval(nil, { enter = true })
			end)

			vim.keymap.set("n", "<Leader>df", dap.toggle_breakpoint)
			vim.keymap.set("n", "<Leader>gb", dap.run_to_cursor)
			vim.keymap.set("n", "<Leader>dj", dap.continue)
			vim.keymap.set("n", "<F2>", dap.step_into)
			vim.keymap.set("n", "<Leader>dk", dap.step_over)
			vim.keymap.set("n", "<F4>", dap.step_out)
			vim.keymap.set("n", "<F5>", dap.step_back)
			vim.keymap.set("n", "<Leader>dr", dap.restart)
			vim.keymap.set("n", "<Leader>dd", function()
				require("dap").disconnect(require("dapui").close())
			end)

			dap.listeners.before.attach.dapui_config = function()
				ui.open()
			end
			dap.listeners.before.launch.dapui_config = function()
				ui.open()
			end
			dap.listeners.before.disconnect.dapui_config = function()
				ui.close()
			end
			dap.listeners.before.terminate.dapui_config = function()
				ui.close()
			end
		end,
	},
}
