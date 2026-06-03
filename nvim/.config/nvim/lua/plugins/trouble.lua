vim.pack.add({ "https://github.com/folke/trouble.nvim" })
require("trouble").setup({
  modes = {
    test = {
      mode = "diagnostics",
      preview = {
        type = "split",
        relative = "win",
        position = "right",
        size = 0.3,
      },
    },
  },
})
