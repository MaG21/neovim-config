vim.lsp.config.lua = {
  cmd = { "lua-language-server" },
  filetypes = { "lua" },
  root_markers = {
    ".luarc.json",
    ".luarc.jsonc",
    ".luacheckrc",
    ".stylua.toml",
    "stylua.toml",
    "selene.toml",
    "selene.yml",
    ".git",
  },
	settings = {
		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				library = {
          vim.env.VIMRUNTIME,
          vim.fn.stdpath("config"),
          vim.fn.stdpath('data') .. '/site/pack/packer/start'
				},
			},
      telemetry = {
        enable = false,
      },
		},
	},
}
vim.lsp.enable('lua')
