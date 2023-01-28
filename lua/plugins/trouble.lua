local map = require('utils').make_lazy_map()

return {
  'folke/trouble.nvim',
  cmd = { 'Trouble', 'TroubleClose', 'TroubleToggle', 'TroubleRefresh' },
  keys = {
    map('n', '<C-d>', ':TroubleToggle<CR>')
  },
  config = function()
    require('trouble').setup {
      mode = 'document_diagnostics',
      use_diagnostic_signs = true,
    }
  end
}
