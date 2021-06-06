local opt = vim.opt

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

opt.completeopt = { 'menuone', 'noselect' }
-- Remove compe status display
opt.shortmess:append('c')

-- Set indent length
opt.tabstop = 4
opt.shiftwidth = 0
opt.expandtab = true

opt.showmode = false

-- Disable duplicate mode display
opt.showmode = false

-- Configure terminal
vim.cmd([[
augroup neovim_terminal
  autocmd!
  " Enter Terminal-mode (insert) automatically
  autocmd TermOpen * startinsert
  autocmd BufEnter term://* startinsert
  " Disables number lines on terminal buffers
  autocmd TermOpen * :set nonumber norelativenumber
augroup END
]])
