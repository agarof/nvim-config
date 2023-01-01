local opt = vim.o

opt.foldlevelstart = 99

-- Make filenames autocompletion case-insensitive
opt.wildignorecase = true

-- Make search case insensitive if all lowercase
opt.ignorecase = true
opt.smartcase = true

-- Set line numbers
opt.number = true
opt.relativenumber = true

-- Set cursor scroll distance
opt.scrolloff = 99

-- Shorten key sequence timeout
opt.timeoutlen = 200

-- Use the clipboard as default register
opt.clipboard = 'unnamedplus'

-- Set indent length
opt.tabstop = 4
opt.shiftwidth = 0
opt.expandtab = true

-- Disable duplicate mode display
opt.showmode = false

-- Configure terminal
local termgroup = vim.api.nvim_create_augroup('neovim_terminal', { clear = true })
vim.api.nvim_create_autocmd('TermOpen', { callback = function()
  opt.number = false
  opt.relativenumber = false
end, group = termgroup })
vim.api.nvim_create_autocmd('TermOpen', { command = 'startinsert', group = termgroup })
vim.api.nvim_create_autocmd('BufEnter', { pattern = 'term://*', command = 'startinsert', group = termgroup })
