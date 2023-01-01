local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
local packer_bootstrap = false
if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim',
    install_path })
  -- Check if clone was successful
  packer_bootstrap = vim.v.shell_error == 0
end

local packer = require('packer')

packer.startup(
  function(use)
    use 'wbthomason/packer.nvim'

    -- Colorschemes
    use 'folke/tokyonight.nvim'

    -- StatusLine
    use { 'hoob3rt/lualine.nvim', config = require('plugins.lualine') }

    use {
      'neovim/nvim-lspconfig',
      tag = "v0.1.4",
      config = require('plugins.lspconfig').config,
      requires = {
        'simrat39/rust-tools.nvim',
        'MunifTanjim/prettier.nvim',
        {
          'simrat39/symbols-outline.nvim',
          config = function()
            require('symbols-outline').setup()
          end
        },
        {
          "https://git.sr.ht/~whynothugo/lsp_lines.nvim",
          config = function()
            require("lsp_lines").setup()
          end,
        },
      },
    }

    -- File tree
    use(require('plugins.neotree'))

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
    use {
      'hrsh7th/nvim-cmp',
      requires = {
        'hrsh7th/cmp-calc',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-nvim-lsp',
        'saadparwaiz1/cmp_luasnip',
      },
      config = require('plugins.cmp'),
    }

    use { 'L3MON4D3/LuaSnip', config = require('plugins.luasnip') }

    use { 'rhysd/git-messenger.vim', config = require('plugins.git-messenger') }

    -- Finder
    use {
      'nvim-telescope/telescope.nvim',
      requires = {
        { 'nvim-lua/plenary.nvim' },
        { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' },
        { 'gbrlsnchs/telescope-lsp-handlers.nvim' },
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


    -- Startup time benchmark
    use 'tweekmonster/startuptime.vim'

    use { 'windwp/nvim-autopairs', config = require('plugins.autopairs') }

    use { 'folke/zen-mode.nvim', config = require('plugins.zen-mode') }

    if packer_bootstrap then
      require('packer').sync()
    end
  end
)
