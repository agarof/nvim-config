local utils = require("utils")

local options = { expr = true, noremap = false }

vim.g.vsnip_snippet_dir = '$HOME/.config/nvim/snippets'

utils.map('i', '<C-l>', "vsnip#jumpable(1)  ? '<Plug>(vsnip-jump-next)' : '<C-l>'", options)
utils.map('s', '<C-l>', "vsnip#jumpable(1)  ? '<Plug>(vsnip-jump-next)' : '<C-l>'", options)
utils.map('i', '<C-h>', "vsnip#jumpable(-1) ? '<Plug>(vsnip-jump-prev)' : '<C-h>'", options)
utils.map('s', '<C-h>', "vsnip#jumpable(-1) ? '<Plug>(vsnip-jump-prev)' : '<C-h>'", options)
