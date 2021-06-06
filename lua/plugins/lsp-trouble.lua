return function ()
  local map = require('utils').map

  require('trouble').setup {
    use_lsp_diagnostic_signs = true,
  }

  map('n', '<C-d>', ':LspTroubleToggle<CR>')
end
