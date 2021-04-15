local highlight = function (group, color)
  local command = 'hi ' .. group .. ' '
  if color.style then command = command .. 'gui='   .. color.style end
  if color.fg    then command = command .. 'guifg=' .. color.fg    end
  if color.bg    then command = command .. 'guibg=' .. color.bg    end
  if color.sp    then command = command .. 'guisp=' .. color.sp    end

  vim.cmd(command)
end

vim.cmd('set termguicolors')
vim.cmd('colorscheme codedark')

highlight('VertSplit', { bg = 'None' })
