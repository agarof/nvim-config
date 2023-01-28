local version = '9.5.0'

return {
  version = version,

  setup = function()
    local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
    if not vim.loop.fs_stat(lazypath) then
      vim.fn.system({
        'git',
        'clone',
        '--filter=blob:none',
        'https://github.com/folke/lazy.nvim.git',
        '--branch=v' .. version,
        lazypath,
      })
    end
    vim.opt.rtp:prepend(lazypath)

    require('lazy').setup('plugins', {
      install = { colorscheme = { 'tokyonight', 'habamax' } }
    })
  end
}
