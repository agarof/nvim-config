local map = require('utils').make_lazy_map()

return {
  'folke/twilight.nvim',
  cmd = { 'Twilight', 'TwilightEnable', 'TwilightDisable' },
  keys = {
    map('n', 'zt', ':Twilight<CR>'),
  }
}
