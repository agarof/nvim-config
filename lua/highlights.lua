---@param group string
---@param value? table
local highlight = function(group, value)
  vim.api.nvim_set_hl(0, group, value or {})
end

vim.cmd('colorscheme tokyonight-storm')

-- Clear split separator background
highlight('VertSplit')

-- Clear background colors
highlight('Normal')
highlight('NormalNC')
