vim.pack.add({
  "https://github.com/rcarriga/nvim-notify",
})
local notify = require("notify")
notify.setup({
  background_colour = "#ffffff",
  merge_duplicates = true,
})

vim.notify = notify
