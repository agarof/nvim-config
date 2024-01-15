return {
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
        -- Setup your lua path
        path = vim.split(package.path, ';'),
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = { 'vim' },
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        library = {
          [vim.fn.expand('$VIMRUNTIME/lua')] = true,
          [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true,
        },
      },
      format = {
        defaultConfig = {
          quote_style = 'single',
          table_separator_style = 'comma',
          trailing_table_separator = 'smart',
          max_line_length = '100',
          indent_style = 'space',
          indent_size = '2',
          continuation_indent = '2',
          align_array_table = 'false',
        },
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
  cmd = { '/usr/bin/lua-language-server' },
}
