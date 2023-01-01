return {
  make_map = function(default_opts)
    local default_options = {
      silent = true
    }

    default_opts = vim.tbl_extend('force', default_options, default_opts or {})

    return function(mode, keys, action, opts)
      opts = vim.tbl_extend('force', default_opts, opts or {})

      vim.keymap.set(mode, keys, action, opts)
    end
  end,

  highlight = function(group, opt_color)
    local color = opt_color or {}
    local command = 'hi ' .. group .. ' '
        .. 'gui=' .. (color.style or 'None') .. ' '
        .. 'guifg=' .. (color.fg or 'None') .. ' '
        .. 'guibg=' .. (color.bg or 'None') .. ' '
        .. 'guisp=' .. (color.sp or 'None') .. ' '

    vim.cmd(command)
  end,
}
