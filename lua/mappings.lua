local map = require('utils').make_map()

-- Set leader key
vim.g.mapleader = ','

-- Remap ; to :
map({ 'n', 'v' }, ';', ':')

-- hn to return to normal mode
map('i', 'hn', '<C-c>')
map('v', 'hn', '<C-c>')

-- tab navigation
map('n', '<C-h>', ':tabprevious<CR>')
map('n', '<C-l>', ':tabnext<CR>')
map('n', '<C-S-H>', ':tabmove -1<CR>')
map('n', '<C-S-L>', ':tabmove +1<CR>')
map('n', '<C-t>', ':tabnew<CR>')
map('n', '<C-c>', ':tabclose<CR>')

-- Allow window movement from active terminal
map('t', '<C-w>', '<C-\\><C-n><C-w>')
map('t', 'hn', '<C-\\><C-n>')

map('n', '<Up>', ':resize -1<CR>')
map('n', '<Down>', ':resize +1<CR>')
map('n', '<Left>', ':vertical resize -1<CR>')
map('n', '<Right>', ':vertical resize +1<CR>')

map('n', 'gl', function()
  lines_enabled = vim.diagnostic.config().virtual_lines
  vim.diagnostic.config({
    virtual_lines = not lines_enabled,
    virtual_text = lines_enabled and { prefix = '' } or false,
  })
end)
map('n', '<leader>d', vim.diagnostic.open_float)
