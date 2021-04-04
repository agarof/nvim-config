local utils = require('utils')

utils.map('i', '<C-l>', '<cmd>lua return require\'snippets\'.expand_or_advance(1)<CR>')
utils.map('i', '<C-h>', '<cmd>lua return require\'snippets\'.advance_snippet(-1)<CR>')

require('snippets').snippets = {
  cpp = {
    class = [[
class $1
{
public:
    $1() noexcept = default;
    $1($1 const& to_copy) noexcept = default;
    $1($1&& to_move) noexcept = default;
    ~$1() noexcept = default;

    auto operator=($1 const& rhs) noexcept -> $1& = default;
    auto operator=($1&& rhs) noexcept -> $1& = default;

private:
};
    ]],
  }
}
