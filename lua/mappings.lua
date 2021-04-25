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
