-- Base configuration
require 'mag.options'
require 'mag.plugins'
require 'mag.colorscheme'

-- Get our globals file.
local status, globals = pcall(require, "mag.globals")
if not status then
  error("Problems loading globals" .. globals)
  return
end

vim.g.globals = globals

-- Plugins
-- Make sure that globals is set after this point

require 'mag.keymaps'
require 'mag.cmp'
require 'mag.lsp'
require 'mag.telescope'
require 'mag.treesitter'
require 'mag.gitsigns'
require 'mag.nvim-tree'
require 'mag.bufferline'
require 'mag.lualine'
require 'mag.nvim-dap'
require 'mag.copilot-config'
