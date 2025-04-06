local map = require('utils').make_lazy_map()

return {
  -- Pin lazy.nvim version
  { 'folke/lazy.nvim', version = require('lazy-manager').version },

  -- Colorschemes
  { 'folke/tokyonight.nvim', version = '4' },

  { 'windwp/nvim-autopairs', event = 'InsertEnter', config = true },

  { 'stevearc/dressing.nvim', event = 'VeryLazy', config = true, enabled = false },

  { 'norcalli/nvim-colorizer.lua', event = 'VeryLazy', config = true },

  { 'rhysd/git-messenger.vim', keys = { map('n', '<Leader>b', '<Plug>(git-messenger)') } },

  {
    'numToStr/Comment.nvim',
    event = 'VeryLazy',
    config = function()
      require('Comment').setup()
      require('Comment.ft').set('asm', '//%s')
    end,
  },

  {
    'OXY2DEV/markview.nvim',

    version = 'v25',
    dependencies = {
      'nvim-treesitter/nvim-treesitter',
      'nvim-tree/nvim-web-devicons',
    },
    ft = 'markdown',
  },
}
