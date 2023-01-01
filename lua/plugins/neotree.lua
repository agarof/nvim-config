local window_picker = {
  's1n7ax/nvim-window-picker',
  tag = "v1.*",
  config = function()
    require('window-picker').setup({
      autoselect_one = true,
      include_current = false,
      selection_chars = 'AOUIHTNS',
      filter_rules = {
        -- filter using buffer options
        bo = {
          -- if the file type is one of following, the window will be ignored
          filetype = { 'neo-tree', "neo-tree-popup", "notify" },

          -- if the buffer type is one of following, the window will be ignored
          buftype = { 'terminal', "quickfix" },
        },
      },
      other_win_hl_color = '#e35e4f',
    })
  end,
}

return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v2.x",
  requires = {
    "nvim-lua/plenary.nvim",
    "kyazdani42/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
    window_picker,
  },
  config = function()
    require('neo-tree').setup({
      hijack_netrw_behavior = 'open_current',
      window = {
        mappings = {
          ["<CR>"] = "open_with_window_picker",
        },
      },
    })

    local utils = require('utils')

    utils.make_map()('n', '<leader>t', ':Neotree reveal toggle<CR>')
    utils.make_map()('n', '<leader>s', ':Neotree git_status reveal toggle<CR>')
  end
}
