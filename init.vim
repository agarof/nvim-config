"Load lua config
luafile $HOME/.config/nvim/lua/config.lua

set completeopt+=preview

"Use syntax-based folding
set foldmethod=syntax
set foldlevelstart=99

"Set indent length
set tabstop=4
set shiftwidth=4

"Make filenames autocompletion case-insensitive
set wildignorecase

"Make search case insensitive if all lowercase
set ignorecase
set smartcase

"Set line numbers
set number
set relativenumber

"Set cursor scroll distance
set scrolloff=99

"Shorten key sequence timeout
set timeoutlen=200

"Use the clipboard as default register
set clipboard=unnamedplus
set completeopt=menuone,noselect

set nocp
filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab
syntax enable
set noshowmode
