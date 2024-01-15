local map = require('utils').make_lazy_map()

return {
  'folke/trouble.nvim',
  cmd = { 'Trouble', 'TroubleClose', 'TroubleToggle', 'TroubleRefresh' },
  version = '2',
  keys = {
    map('n', '<C-d>', ':TroubleToggle<CR>'),
  },
  opts = {
    mode = 'document_diagnostics',
    use_diagnostic_signs = true,
  },
}
