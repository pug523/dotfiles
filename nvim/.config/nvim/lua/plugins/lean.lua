vim.pack.add({ "https://github.com/julian/lean.nvim" })
require("lean").setup({
  mappings = true, -- enables useful Lean keybindings
  abbreviations = { builtin = true }, -- auto-expansion of unicode symbols
})
