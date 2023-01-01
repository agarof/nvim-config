local ls = require('luasnip')
local s = ls.s
local i = ls.insert_node
local rep = require('luasnip.extras').rep
local fmt = require('luasnip.extras.fmt').fmt

return {
  s('loc', fmt('local {} = {}', { i(1, 'foo'), i(2, 'bar') })),
  s('locreq', fmt("local {} = require('{}{}')", { i(1, 'module'), rep(1), i(2) })),
}
