local highlight = require('utils').highlight

vim.o.termguicolors = true
vim.cmd('colorscheme codedark')

highlight('VertSplit', { bg = 'None' })
