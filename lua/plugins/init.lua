require('packer').startup(function (use)
  use 'wbthomason/packer.nvim'

  -- Colorschemes
  use 'folke/tokyonight.nvim'

  -- StatusLine
  use { 'hoob3rt/lualine.nvim', config = require('plugins.lualine') }

  use {
    'neovim/nvim-lspconfig',
    config = require('plugins.lspconfig'),
    requires = {
      {
        'RishabhRD/nvim-lsputils',
        requires = 'RishabhRD/popfix',
      },
      'ray-x/lsp_signature.nvim',
    },
  }

  -- Treesitter
  use {
    {
      'nvim-treesitter/nvim-treesitter',
      run = ':TSUpdate',
      config = require('plugins.treesitter'),
    },
    'nvim-treesitter/playground'
  }

  -- Autocompletion
  use { 'hrsh7th/nvim-compe', config = require('plugins.compe') }

  use { 'hrsh7th/vim-vsnip', config = require('plugins.vsnip') }

  use { 'rhysd/git-messenger.vim', config = require('plugins.git-messenger') }

  -- Finder
  use {
    'nvim-telescope/telescope.nvim',
    requires = {
      { 'nvim-lua/popup.nvim' },
      { 'nvim-lua/plenary.nvim' },
      { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
    },
    config = require('plugins.telescope')
  }

  -- Icons
  use 'kyazdani42/nvim-web-devicons'

  -- Lsp Diagnostics window
  use {
    'folke/lsp-trouble.nvim',
    requires = 'kyazdani42/nvim-web-devicons',
    config = require('plugins.lsp-trouble'),
  }

  -- Lsp diagnostics highlights
  use 'folke/lsp-colors.nvim'

  -- Startup time benchmark
  use 'tweekmonster/startuptime.vim'

  use { 'steelsojka/pears.nvim', config = require('plugins.pears') }

  use { 'folke/zen-mode.nvim', config = require('plugins.zen-mode') }
end)