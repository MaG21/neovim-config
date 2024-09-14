local colorscheme = "bluloco"

local status_ok, bluloco = pcall(require, "bluloco")
if not status_ok then
  print "Color Scheme blueloco is not available."
  return
end

-- call setup before setting the colorsheme
bluloco.setup({
  style = "auto",               -- "auto" | "dark" | "light"
  transparent = false,
  italics = false,
  terminal = vim.fn.has("gui_running") == 1, -- bluoco colors are enabled in gui terminals per default.
  guicursor   = true,
})

local status_ok_scheme, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not status_ok_scheme then
  vim.notify("colorscheme " .. colorscheme .. " not found!")
  return
end
