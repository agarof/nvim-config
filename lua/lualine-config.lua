local colors = {
  white    = '#D4D4D4',
  grey     = '#3C3C3C',
  darkgrey = '#262626',
  blue     = '#569CD6',
  yellow   = '#D7BA7D',
  green    = '#608B4E',
}

local mode_highlight = function (highlight)
  return {
    a = { bg = highlight,       fg = colors.grey, gui = 'bold' },
    b = { bg = colors.grey,     fg = highlight                 },
    c = { bg = colors.darkgrey, fg = colors.white              },
  }
end

local theme = {
  normal = mode_highlight(colors.blue),
  insert = mode_highlight(colors.yellow),
  visual = mode_highlight(colors.green),
}

local diagnostics = {
  'diagnostics',
  sources = { 'nvim_lsp' },
  color_error = '#F44747',
  color_warn = '#E0AF68',
  color_info = '#10B981',
  symbols = { error = ' ', warn = ' ', info = ' ' },
}

require("lualine").setup {
  sections = {
    lualine_a = { 'mode' },
    lualine_b = { 'branch', diagnostics },
    lualine_c = { 'filename' },
    lualine_x = { 'encoding', 'fileformat' },
    lualine_y = { 'filetype' },
    lualine_z = { 'location' }
  },

  options = {
    theme = theme,
  },
}
