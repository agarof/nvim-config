return require('packer').startup(function (use)
  use 'wbthomason/packer.nvim'

  -- Colorschemes
  use 'folke/tokyonight.nvim'

  -- StatusLine
  use { 'hoob3rt/lualine.nvim', config = require('config.lualine') }

  use {
    'neovim/nvim-lspconfig',
    config = require('config.lsp'),
    requires = {
      {
        'RishabhRD/nvim-lsputils',
        requires = 'RishabhRD/popfix',
      },
    },
  }

  -- Treesitter
  use {
    {
      'nvim-treesitter/nvim-treesitter',
      run = ':TSUpdate',
      config = require('config.treesitter'),
    },
    'nvim-treesitter/playground'
  }

  -- Autocompletion
  use { 'hrsh7th/nvim-compe', config = require('config.compe') }

  use { 'hrsh7th/vim-vsnip', config = require('config.vsnip') }

  use { 'rhysd/git-messenger.vim', config = require('config.git-messenger') }

  -- Finder
  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      { 'nvim-lua/popup.nvim' },
      { 'nvim-lua/plenary.nvim' },
      { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
    },
    config = require('config.telescope')
  }

  -- Icons
  use 'kyazdani42/nvim-web-devicons'

  -- Lsp Diagnostics window
  use {
    'folke/lsp-trouble.nvim',
    requires = 'kyazdani42/nvim-web-devicons',
    config = require('config.lsp-trouble'),
  }

  -- Lsp diagnostics highlights
  use 'folke/lsp-colors.nvim'

  -- Startup time benchmark
  use 'tweekmonster/startuptime.vim'
end)
