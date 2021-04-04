local default_options = {
  noremap = true,
  silent = true
}

return {
  map = function (mode, keys, action, opts)
    local options = default_options
    if opts then options = vim.tbl_extend('force', options, opts) end

    vim.api.nvim_set_keymap(mode, keys, action, options)
  end,

  buf_map = function (buffer, mode, keys, action, opts)
    local options = default_options
    if opts then options = vim.tbl_extend('force', options, opts) end

    vim.api.nvim_buf_set_keymap(buffer, mode, keys, action, options)
  end
}
