return function()
  local map = require('utils').make_map()

  require('trouble').setup {
    mode = 'document_diagnostics',
    use_diagnostic_signs = true,
  }

  map('n', '<C-d>', ':TroubleToggle<CR>')
end
