return function ()
  local map = require("utils").map
  local telescope = require('telescope')

  telescope.load_extension('fzy_native')

  map('n', '<C-f>', ':Telescope find_files<CR>')
  map('n', '<C-g>', ':Telescope live_grep<CR>')
  map('n', '<C-s>', ':Telescope lsp_references<CR>')
end
