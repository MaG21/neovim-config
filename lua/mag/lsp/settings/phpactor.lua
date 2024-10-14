return {
  filetypes = { 'php' },
  init_options = {
    ["language_server_phpstan.enabled"] = true,
    ['worse_reflection.stub_dir'] = '%project_root%/.ide_helper',
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
