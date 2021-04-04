"Configure Plug
call plug#begin('~/.vim/plugged')
Plug 'cloudhead/neovim-fuzzy'
"Plug 'tomasiser/vim-code-dark'
Plug 'Mofiqul/vim-code-dark'
Plug 'doums/darcula'
Plug 'vim-airline/vim-airline'
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'
Plug 'hrsh7th/nvim-compe'
Plug 'norcalli/snippets.nvim'
Plug 'hrsh7th/vim-vsnip'
Plug 'kjwon15/vim-transparent'
call plug#end()

"Load lua config
luafile $HOME/.config/nvim/lua/config.lua

"Set fuzzy-search keybind
nnoremap <C-f> :FuzzyOpen<CR>

"map <c-space> to manually trigger completion
set completeopt+=preview

" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

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

"Set colorscheme
set termguicolors
colorscheme codedark

"Remap ; to :
nnoremap ; :

"Shorten key sequence timeout
set timeoutlen=200

"hn to return to normal mode
inoremap hn <Esc>
vnoremap hn <Esc>

"Use the clipboard as default register
set clipboard=unnamedplus
set completeopt=menuone,noselect

set nocp
filetype plugin indent on
set tabstop=4
set shiftwidth=4
set expandtab
syntax enable

"Allow window movement from active terminal
tnoremap <C-w> <C-\><C-n><C-w>

"Configure airline
let g:airline#extensions#tabline#tab_min_count = 2
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#enabled = 1
let g:airline_skip_empty_sections = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='codedark'
