local map = require('utils').make_lazy_map()

return {
  'nvim-telescope/telescope.nvim',
  version = '0.1',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
    'gbrlsnchs/telescope-lsp-handlers.nvim',
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  },
  cmd = 'Telescope',
  keys = {
    map('n', '<C-f>', ':Telescope find_files<CR>'),
    map('n', '<C-g>', ':Telescope live_grep<CR>'),
    map('n', '<C-s>', ':Telescope lsp_references<CR>'),
  },
  config = function()
    local telescope = require('telescope')
    local actions = require('telescope.actions')

    telescope.setup {
      defaults = {
        mappings = {
          n = {
            ['q'] = actions.close,
          },
        },
      },
      extensions = {
        fzf = {
          override_generic_sorter = true,
          override_file_sorter = true,
        },
      },
    }

    telescope.load_extension('fzf')
    telescope.load_extension('lsp_handlers')
  end,
}
