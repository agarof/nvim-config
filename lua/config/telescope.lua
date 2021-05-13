return function ()
  local map = require("utils").map
  local telescope = require('telescope')

  telescope.setup {
    extensions = {
      fzf = {
        override_generic_sorter = true,
        override_file_sorter = true,
      },
    },
  }

  telescope.load_extension('fzf')

  map('n', '<C-f>', ':Telescope find_files<CR>')
  map('n', '<C-g>', ':Telescope live_grep<CR>')
  map('n', '<C-s>', ':Telescope lsp_references<CR>')
end
