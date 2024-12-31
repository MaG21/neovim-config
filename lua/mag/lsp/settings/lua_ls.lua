return {
	settings = {

		Lua = {
			diagnostics = {
				globals = { "vim" },
			},
			workspace = {
				library = {
          vim.env.VIMRUNTIME,
					vim.fn.stdpath("config") .. "/lua",
          vim.fn.stdpath('data') .. '/site/pack/packer/start'
				},
			},
		},
	},
}
