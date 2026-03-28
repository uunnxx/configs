return {
	"mfussenegger/nvim-dap",
	dependencies = {
		"rcarriga/nvim-dap-ui",
		"nvim-neotest/nvim-nio",
		"mfussenegger/nvim-dap-python",
	},
	lazy = true,
	ft = { "python", "py" },

	config = function()
		local dap = require("dap")
		local dapui = require("dapui")
		local dappython = require("dap-python")

		dapui.setup()

		dap.listeners.after.event_initialized["dapui_config"] = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated["dapui_config"] = function()
			dapui.close()
		end
		dap.listeners.before.event_exited["dapui_config"] = function()
			dapui.close()
		end

		-- path to the python executable in mason debugpy venv if installed via mason
		local path = "~/.local/share/nvim/mason/packages/debugpy/venv/bin/python"
		dappython.setup(path)
	end,

	keys = {
		{
			"<space>du",
			function()
				require("dapui").toggle()
			end,
			desc = "Toggle DAP UI",
		},
		{
			"<space>db",
			function()
				require("dap").toggle_breakpoint()
			end,
			desc = "Toggle Breakpoint",
		},
		{
			"<space>dc",
			function()
				require("dap").continue()
			end,
			desc = "Continue/Start",
		},
		{
			"<space>dm",
			function()
				require("dap-python").test_method()
			end,
			desc = "Debug Method",
		},
		{
			"<space>df",
			function()
				require("dap-python").test_class()
			end,
			desc = "Debug Class",
		},
	},
}
