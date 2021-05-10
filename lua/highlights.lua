local highlight = require('utils').highlight

vim.o.termguicolors = true
vim.cmd('colorscheme tokyonight')

highlight('VertSplit', { bg = 'None' })
