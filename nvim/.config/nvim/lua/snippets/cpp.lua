local ls = require("luasnip")
local s = ls.snippet
local i = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep

return {
  s(
    "cl",
    fmt(
      [[
class {} {{
 public:
  {}() = default;
  ~{}() = default;

  {}(const {}&) = delete;
  {}& operator=(const {}&) = delete;

  {}({}&&) noexcept = default;
  {}& operator=({}&&) noexcept = default;

 private:
  {}
}};
]],
      {
        i(1, "C"),
        rep(1),
        rep(1),
        rep(1),
        rep(1),
        rep(1),
        rep(1),
        rep(1),
        rep(1),
        rep(1),
        rep(1),
        i(0), -- cursor
      }
    )
  ),
}
