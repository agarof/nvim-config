local ls = require('luasnip')
local s = ls.s
local i = ls.insert_node
local fmt = require('luasnip.extras.fmt').fmt

return {
  s('derive', fmt("#[derive({})]", { i(1, 'Debug') })),
}
