return require('packer').startup(function (use)
  use 'wbthomason/packer.nvim'

  -- Colorschemes
  use 'Mofiqul/vim-code-dark'
  use 'doums/darcula'
  use 'kjwon15/vim-transparent'

  -- StatusLine
  use 'hoob3rt/lualine.nvim'

  use 'neovim/nvim-lspconfig'

  -- Treesitter
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use 'nvim-treesitter/playground'

  -- Autocompletion
  use 'hrsh7th/nvim-compe'

  use 'hrsh7th/vim-vsnip'

  use 'rhysd/git-messenger.vim'

  -- Finder
  use {
      'nvim-telescope/telescope.nvim',
      requires = {{'nvim-lua/popup.nvim'}, {'nvim-lua/plenary.nvim'}}
  }
end)
