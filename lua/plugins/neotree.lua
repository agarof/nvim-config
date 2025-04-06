local map = require('utils').make_lazy_map()

local window_picker = {
  's1n7ax/nvim-window-picker',
  version = '2.4',
  opts = {
    selection_chars = 'AOUIHTNS',
    filter_rules = {
      -- filter using buffer options
      bo = {
        -- if the file type is one of following, the window will be ignored
        filetype = { 'neo-tree', 'neo-tree-popup', 'notify' },
      },
    },
    other_win_hl_color = '#e35e4f',
  },
}

return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '3',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
    window_picker,
  },
  keys = {
    map('n', '<leader>t', ':Neotree reveal toggle<CR>'),
    map('n', '<leader>s', ':Neotree git_status reveal toggle<CR>'),
  },
  opts = {
    hijack_netrw_behavior = 'open_current',
    window = {
      mappings = {
        ['<CR>'] = 'open_with_window_picker',
      },
    },
  },
}
