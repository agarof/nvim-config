local diagnostic_lines_enable = false

local toggle_diagnostic_text = function()
  diagnostic_lines_enable = not diagnostic_lines_enable

  ---@type boolean | table
  local virtual_enable = false
  local diagnostic_text = { prefix = '' }

  if not diagnostic_lines_enable then
    virtual_enable = diagnostic_text
  end

  vim.diagnostic.config({
    virtual_text = virtual_enable,
    virtual_lines = diagnostic_lines_enable,
  })
end

local map = require('utils').make_lazy_map()

return {
  url = 'https://git.sr.ht/~whynothugo/lsp_lines.nvim',
  keys = {
    map('n', 'gl', toggle_diagnostic_text),
  },
  config = true,
}
