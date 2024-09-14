local configs = require("nvim-treesitter.configs")
configs.setup {
  ensure_installed =  {
    "lua",
    "markdown",
    "markdown_inline",
    "bash",
    "ruby",
    "python",
    "javascript",
    "json",
    "php",
    "c",
    "cpp",
    "css",
    "yaml"
  },
  sync_install = false,
  ignore_install = { "" }, -- List of parsers to ignore installing
  highlight = {
    enable = true, -- false will disable the whole extension
    disable = { "" }, -- list of language that will be disabled
    additional_vim_regex_highlighting = true,

  },
  indent = {
    enable = true,
    disable = { "python", "css" }
  },
}
