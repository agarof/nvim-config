return function ()
  local map = require('utils').map

  map('n', '<Leader>g', '<Plug>(git-messenger)', { noremap = false })
end
