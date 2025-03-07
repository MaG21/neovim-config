local null_ls_status_ok, null_ls = pcall(require, "null-ls")
if not null_ls_status_ok then
	return
end

-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/formatting
local formatting = null_ls.builtins.formatting
-- https://github.com/jose-elias-alvarez/null-ls.nvim/tree/main/lua/null-ls/builtins/diagnostics
local diagnostics = null_ls.builtins.diagnostics

null_ls.setup({
	debug = false,
	sources = {
		formatting.prettier.with({ extra_args = { "--no-semi", "--single-quote", "--jsx-single-quote" } }),
    formatting.isort.with({
      extra_args =  {
        "--line-width",
        "120",
      }
    }),
		formatting.black.with({
			extra_args = {
        "--line-length",
        "120",
      },
		}),
		formatting.stylua,
		diagnostics.flake8.with({
			extra_args = {
				"--max-line-length",
				"120",
				"--exclude",
				".git,__pycache__,docs/source/conf.py,old,build,dist",
				"--max-complexity",
				"25",
			},
		}),
		diagnostics.pylint.with({
			extra_args = {
				"--good-names=i,j,k,ex,Run,_,id",
				"--ignored-classes=dependency_injector.providers.Configuration,"
					.. "dependency_injector.providers.Container,"
					.. "dependency_injector.providers.DependenciesContainer",
				"--extension-pkg-allow-list",
				"dependency_injector",
			},
		}),
		diagnostics.phpcs.with({ extra_args = { "--standard=~/.phpcs/phpcs.xml" } }),
		formatting.phpcbf.with({ extra_args = { "--standard=~/.phpcs/phpcs.xml" } }),
	},
})
