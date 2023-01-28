return {
  'L3MON4D3/LuaSnip',
  event = 'InsertEnter',
  version = '1.2',
  config = function()
    local config = {
      history = true,
      updateevents = 'TextChanged,TextChangedI',
      delete_check_events = 'TextChanged',
    }

    local ls = require('luasnip')

    ls.config.set_config(config)

    -- TODO: Replace with neovim's lua keymap API when it lands
    local map = require('utils').make_map()

    map({ 'i', 's' }, '<C-l>', function() ls.jump(1) end)
    map({ 'i', 's' }, '<C-h>', function() ls.jump(-1) end)
    map({ 'i', 's' }, '<C-j>', function() ls.change_choice(1) end)
    map({ 'i', 's' }, '<C-k>', function() ls.change_choice(-1) end)

    require("luasnip.loaders.from_lua").lazy_load({ paths = vim.fn.stdpath('config') .. '/luasnippets' })
  end,
}
