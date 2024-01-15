local map = require('utils').make_lazy_map()

return {
  -- Pin lazy.nvim version
  { 'folke/lazy.nvim', version = require('lazy-manager').version },

  -- Colorschemes
  { 'folke/tokyonight.nvim', version = '2' },

  { 'windwp/nvim-autopairs', event = 'InsertEnter', config = true },

  { 'stevearc/dressing.nvim', event = 'VeryLazy', config = true },

  { 'norcalli/nvim-colorizer.lua', event = 'VeryLazy', config = true },

  { 'nvim-treesitter/playground', cmd = 'TSPlaygroundToggle' },

  { 'rhysd/git-messenger.vim', keys = { map('n', '<Leader>b', '<Plug>(git-messenger)') } },

  { 'numToStr/Comment.nvim', event = 'VeryLazy', config = true },
}
