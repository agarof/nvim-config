return function ()
  require('zen-mode').setup {
    window = {
      backdrop = 1,
      width = 126,
    }
  }

  require('utils').map('n', 'zm', ':ZenMode<CR>')
end
