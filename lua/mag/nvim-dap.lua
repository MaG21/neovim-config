local status_ok_dap, dap = pcall(require, "dap")
if not status_ok_dap then
	return
end

dap.adapters.php = {
	type = "executable",
	command = "node",
	args = { vim.fn.stdpath("config") .. "/lua/mag/adapters/php/ext/phpDebug.js" },
}

dap.configurations.php = {
	{
		type = "php",
		name = "Listen for Xdebug",
		request = "launch",
		port = 9003,
	},
}

local keymap = vim.keymap.set
keymap("n", "<space>c", dap.continue)
keymap("n", "<space>,", dap.step_over)
keymap("n", "<space>.", dap.step_into)
keymap("n", "<space>b", dap.toggle_breakpoint)
keymap("n", "<space>r", dap.repl.open)

local dap_widgets = require("dap.ui.widgets")
vim.keymap.set("n", "<space>v", function()
	dap_widgets.centered_float(dap_widgets.scopes)
end)

vim.keymap.set("n", "<space>h", dap_widgets.hover)

local status_ok_dap_ui, dapui = pcall(require, "dapui")
if status_ok_dap_ui then
	dapui.setup({
		layouts = {
			{
				-- You can change the order of elements in the sidebar
				elements = {
					-- Provide IDs as strings or tables with "id" and "size" keys
					{
						id = "scopes",
						size = 0.25, -- Can be float or integer > 1
					},
					{ id = "breakpoints", size = 0.25 },
				},
				size = 40,
				position = "left", -- Can be "left" or "right"
			},
			{
				elements = {
					"repl",
					"console",
				},
				size = 10,
				position = "bottom", -- Can be "bottom" or "top"
			},
		},
		mappings = {
			edit = "e",
			expand = "<CR>",
			open = "o",
			remove = "d",
			repl = "r",
			toggle = "t",
		},
	})
	keymap("n", "<space><space>", dapui.toggle)

	vim.keymap.set("n", "<space>?", function()
		dapui.eval(nil, { enter = true })
	end)
end

