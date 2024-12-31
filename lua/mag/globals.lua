local status, snacks = pcall(require, "snacks")
if not status then
  error("Problems loading snacks.lua" .. snacks)
end

-- Snacks is the tool I will be using for notification and other
-- things, snack will not be used directly but instead exposed
-- through a global functionality.

-- Keymaps (I need help organizing my mappings)

-- Configure snacks here since the plan is not to use it elsewhere.
snacks.setup({
  bigfile = { enabled = true },
  indent = { enabled = false },
  input = { enabled = true },
  zen = { enabled = true },
  scratch = { enabled = true },
  bufdelete = { enabled = true },
  rename = { enabled = true },
  gitbrowse = { enabled = true },
  git = { enabled = true },
  dashboard = {
    enabled = true,
    sections = {
      {
        section = "terminal",
        cmd = "ascii-image-converter -C -c " .. "img/neovim.png",
        random = 1,
        pane = 1,
        indent = 1,
        height = 30
      },
      { section = "recent_files", limit = 7, padding = 1 },
    },
  },
  notifier = {
    enabled = true,
    timeout = 3000,
  },
  quickfile = { enabled = true },
  scroll = { enabled = false },
  statuscolumn = { enabled = false },
  words = { enabled = true },
})

-- Module
local M = {}

local is_copilot_enabled = false
M.is_copilot_enabled = function()
  return is_copilot_enabled
end

M.enable_copilot = function()
  is_copilot_enabled = true
end

M.disable_copilot = function()
  is_copilot_enabled = false
end

M.get_snacks_instance = function(fn)
  fn(snacks)
end

-- Use this togler to toggle features (ie copilot)
M.toggler = function(args)
  return snacks.toggle({
    name = args.name,
    color = {
      enabled = "azure",
      disabled = "gray",
    },
    get = args.get,
    set = function(enabled)
      if enabled then
        args.enable()
      else
        args.disable()
      end
    end,
  })
end

M.notify_info = function(msg)
  snacks.notify(msg, { level = "info" })
end

M.notify_warn = function(msg)
  snacks.notify(msg, { level = "warn" })
end

M.notify_error = function(msg)
  snacks.notify(msg, { level = "error" })
end

return M
