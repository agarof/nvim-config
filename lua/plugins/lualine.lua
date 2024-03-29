local colors = {
  white    = '#c0caf5',
  grey     = '#3B4261',
  darkgrey = '#1F2335',
  blue     = '#7aa2f7',
  yellow   = '#e0af68',
  green    = '#9ece6a',
}

local mode_highlight = function(highlight)
  return {
    a = { bg = highlight, fg = colors.darkgrey, gui = 'bold' },
    b = { bg = colors.grey, fg = highlight },
    c = { bg = colors.darkgrey, fg = colors.white },
  }
end

local theme = {
  normal = mode_highlight(colors.blue),
  insert = mode_highlight(colors.yellow),
  visual = mode_highlight(colors.green),
}

local diagnostics = {
  'diagnostics',
  sources = { 'nvim_diagnostic' },
  color_error = '#F44747',
  color_warn = '#E0AF68',
  color_info = '#10B981',
  symbols = { error = ' ', warn = ' ', info = ' ' },
}

local spacer = {
  function() return '%=' end,
  separator = '',
}

local filename = {
  'filename',
  file_status = true,
  path = 1,
}

local filetype = {
  'filetype',
  colored = false,
}

return {
  'hoob3rt/lualine.nvim',
  opts = {
    sections = {
      lualine_a = { 'mode' },
      lualine_b = { 'branch', diagnostics },
      lualine_c = { spacer, filename },
      lualine_x = { 'encoding', 'fileformat' },
      lualine_y = { filetype },
      lualine_z = { 'location' },
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = { spacer, filename },
      lualine_x = {},
      lualine_y = {},
      lualine_z = {},
    },

    options = {
      theme = theme,
    },
  },
}
