local highlight = require('utils').highlight

vim.cmd('colorscheme tokyonight')

-- Clear split separator background
highlight('VertSplit')

-- Clear background colors
highlight('Normal')
highlight('NormalNC')
