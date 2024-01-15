local map = require('utils').make_lazy_map()

return {
  'simrat39/symbols-outline.nvim',
  cmd = { 'SymbolsOutline', 'SymbolsOutlineOpen', 'SymbolsOutlineClose' },
  keys = { map('n', 'go', function() require('symbols-outline').toggle_outline() end) },
  config = true,
}
