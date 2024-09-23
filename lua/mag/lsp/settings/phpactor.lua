return {
  filetypes = { 'php' },
  init_options = {
    ["language_server_phpstan.enabled"] = true
  },
  settings = {
    phpactor = {
      editor = {
        formatOnPaste = true,
        formatOnType = true
      },
      hover = {
        documentation = true,
        references = true,
      },
    },
  },
}
