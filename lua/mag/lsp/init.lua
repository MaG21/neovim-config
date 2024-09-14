local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  return
end

require "mag.lsp.mason"
require("mag.lsp.handlers").setup()
require "mag.lsp.null-ls"
