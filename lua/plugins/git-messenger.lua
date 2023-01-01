return function()
  local map = require('utils').make_map({ remap = true })

  map('n', '<Leader>g', '<Plug>(git-messenger)')
end
