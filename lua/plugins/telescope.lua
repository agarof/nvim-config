return function()
  local map = require("utils").make_map()
  local telescope = require('telescope')
  local actions = require('telescope.actions')

  telescope.setup {
    defaults = {
      mappings = {
        n = {
          ['q'] = actions.close,
        }
      }
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

  map('n', '<C-f>', ':Telescope find_files<CR>')
  map('n', '<C-g>', ':Telescope live_grep<CR>')
  map('n', '<C-s>', ':Telescope lsp_references<CR>')
end
