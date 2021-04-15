local utils = require("utils")

-- Set leader key
vim.g.mapleader = ','

-- Remap ; to :
utils.map('n', ';', ':')

-- hn to return to normal mode
utils.map('i', 'hn', '<C-c>')
utils.map('v', 'hn', '<C-c>')

-- tab navigation
utils.map('n', '<C-h>', ':tabprevious<CR>')
utils.map('n', '<C-l>', ':tabnext<CR>')
utils.map('n', '<C-t>', ':tabnew<CR>')
utils.map('n', '<C-c>', ':tabclose<CR>')

-- Allow window movement from active terminal
utils.map('t', '<C-w>', '<C-\\><C-n><C-w>')

-- Telescope
utils.map('n', '<C-f>', ':Telescope find_files<CR>')
utils.map('n', '<C-g>', ':Telescope live_grep<CR>')
utils.map('n', '<C-s>', ':Telescope lsp_references<CR>')
utils.map('n', '<C-d>', ':Telescope lsp_document_diagnostics<CR>')

-- Compe
local options = { expr = true }
utils.map('i', '<C-Space>', 'compe#complete()',      options)
utils.map('i', '<C-e>',     'compe#close("<C-e>")',  options)
utils.map('i', '<CR>',      'compe#confirm("<CR>")', options)
utils.map('i', '<Tab>',   'pumvisible() ? "<C-n>" : "<Tab>"',   options)
utils.map('i', '<S-Tab>', 'pumvisible() ? "<C-p>" : "<S-Tab>"', options)

-- VSnip
options = { expr = true, noremap = false }
utils.map('i', '<C-l>', 'vsnip#jumpable(1)  ? "<Plug>(vsnip-jump-next)" : "<C-l>"', options)
utils.map('s', '<C-l>', 'vsnip#jumpable(1)  ? "<Plug>(vsnip-jump-next)" : "<C-l>"', options)
utils.map('i', '<C-h>', 'vsnip#jumpable(-1) ? "<Plug>(vsnip-jump-prev)" : "<C-h>"', options)
utils.map('s', '<C-h>', 'vsnip#jumpable(-1) ? "<Plug>(vsnip-jump-prev)" : "<C-h>"', options)

-- GitMessenger
utils.map('n', '<Leader>g', '<Plug>(git-messenger)', { noremap = false })
