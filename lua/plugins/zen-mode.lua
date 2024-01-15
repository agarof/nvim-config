local map = require('utils').make_lazy_map()

return {
  'folke/zen-mode.nvim',
  keys = {
    map('n', 'zm', ':ZenMode<CR>'),
  },
  opts = {
    window = {
      backdrop = 1,
      width = 126,
    },
    plugins = {
      twilight = { enabled = false },
    },
  },
}
