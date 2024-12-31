local status, copilot = pcall(require, "copilot")
if not status then
  vim.g.globals.notify_error("Error loading copilot")
	return
end

local config = {
	filetypes = {
		TelescopePrompt = false,
		conf = false,
		sh = function()
			if string.match(vim.fs.basename(vim.api.nvim_buf_get_name(0)), "^%.env.*") then
				-- disable for .env files
				return false
			end
			return true
		end,
	},
	suggestion = { enabled = true },
	panel = { enabled = true },
}

local client = require('copilot.client')
local command = require('copilot.command')

copilot.setup(config)
require("copilot_cmp").setup()
command.disable()

vim.g.globals.toggler({
  name='Copilot ',
  get = function()
    return not client.is_disabled()
  end,
  enable = function()
    command.enable()
    vim.g.globals.enable_copilot()
  end,
  disable = function()
    command.disable()
    vim.g.globals.disable_copilot()
  end
}):map("<leader>tc")
