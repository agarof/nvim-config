local map = require('utils').make_lazy_map()

return {
  'folke/trouble.nvim',
  version = '3',
  cmd = 'Trouble',
  keys = {
    map('n', '<C-d>', function() require('trouble').toggle('diagnostics') end),
  },
  opts = {},
}
