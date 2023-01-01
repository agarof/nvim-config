return function()
  require('zen-mode').setup {
    window = {
      backdrop = 1,
      width = 126,
    },
    plugins = {
      twilight = { enabled = false },
    },
  }

  local map = require('utils').make_map()

  map('n', 'zm', ':ZenMode<CR>')
end
