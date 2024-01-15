local ls = require('luasnip')
local s = ls.s
local i = ls.insert_node
local rep = require('luasnip.extras').rep
local fmt = require('luasnip.extras.fmt').fmt

return {
  s('struct', fmt([[
      struct {} {{
        {}
      }};
  ]], { i(1), i(2) })),
  s('class', fmt([[
      class {} {{
       public:
        {}() = default;
        {}({} const& other) = default;
        {}({}&& other) = default;
        ~{}() = default;

        {}

       private:
        {}
      }};
  ]], { i(1), rep(1), rep(1), rep(1), rep(1), rep(1), rep(1), i(2), i(3) })),
}
