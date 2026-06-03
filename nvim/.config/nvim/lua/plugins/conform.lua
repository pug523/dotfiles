vim.pack.add({ "https://github.com/stevearc/conform.nvim" })
require("conform").setup({
  formatters_by_ft = {
    lua = { "stylua" },
    c = { "clang-format" },
    cpp = { "clang-format" },
    go = { "gofumpt", "goimports-reviser", "golines" },
    python = { "isort", "black" },
    rust = { "rustfmt" },
    zig = { "zigfmt" },
  },

  formatters = {
    -- C & C++
    ["clang-format"] = {
      prepend_args = {
        "--fail-on-incomplete-format",
        "--ferror-limit=1",
        "--sort-includes",
      },
    },
    -- Golang
    ["goimports-reviser"] = {
      prepend_args = { "-rm-unused" },
    },
    golines = {
      prepend_args = { "--max-len=80" },
    },
    -- Lua
    stylua = {
      prepend_args = {
        "--column-width",
        "80",
        "--line-endings",
        "Unix",
        "--indent-type",
        "Spaces",
        "--indent-width",
        "2",
        "--quote-style",
        "AutoPreferDouble",
      },
    },
    -- Python
    black = {
      prepend_args = {
        "--fast",
        "--line-length",
        "88",
      },
    },
    isort = {
      prepend_args = {
        "--profile",
        "black",
      },
    },
  },

  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_fallback = true,
  },
})
