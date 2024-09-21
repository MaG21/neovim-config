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
		port = 9003
	},
}

local keymap = vim.keymap.set
keymap("n", "<CR>", dap.toggle_breakpoint)
keymap("n", "<Leader>\\", dap.continue)
keymap("n", "<Leader>,", dap.step_over)
keymap("n", "<Leader>.", dap.step_into)
keymap("n", "<Leader>=", dap.repl.open)

local status_ok_dap_ui, dapui = pcall(require, "dapui")
if status_ok_dap_ui then
  dapui.setup()
  keymap("n", "<Leader>'", dapui.toggle)

end


