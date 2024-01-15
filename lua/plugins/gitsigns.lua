local map = require('utils').make_lazy_map()

-- If in visual mode, go back to normal and return selected lines numbers, otherwise return nil
local range_if_visual = function()
  local range = nil

  if vim.api.nvim_get_mode().mode:lower() == 'v' then
    -- Go back to normal mode, updates '< and '>
    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<esc>', true, false, true), 'x', true)
    range = { vim.api.nvim_buf_get_mark(0, '<')[1], vim.api.nvim_buf_get_mark(0, '>')[1] }
  end

  return range
end

return {
  'lewis6991/gitsigns.nvim',
  event = 'VeryLazy',
  keys = {
    map({ 'n', 'v' }, '<Leader>gs', function() require('gitsigns').stage_hunk(range_if_visual()) end),
    map({ 'n', 'v' }, '<Leader>gr', function() require('gitsigns').reset_hunk(range_if_visual()) end),
    map('n', '<Leader>gu', function() require('gitsigns').undo_stage_hunk() end),
    map('n', '<Leader>gn', function() require('gitsigns').next_hunk() end),
    map('n', '<Leader>gp', function() require('gitsigns').prev_hunk() end),
    map('n', '<Leader>gd', function() require('gitsigns').preview_hunk_inline() end),
  },
  opts = {
    preview_config = {
      border = 'solid',
    },
    trouble = false,
  },
}
