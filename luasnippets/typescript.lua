local ls = require('luasnip')
local s = ls.s
local i = ls.insert_node
local rep = require("luasnip.extras").rep
local fmt = require('luasnip.extras.fmt').fmt

return {
  s('unwrap', fmt('const {}_result = await {}\nexpect({}_result.isOk()).toBeTruthy()\nconst {} = {}_result._unsafeUnwrap()', { i(1), i(2), rep(1), rep(1), rep(1) })),
}
