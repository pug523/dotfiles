vim.pack.add({
  "https://github.com/stevearc/oil.nvim",
})
require("oil").setup({})

local map = vim.keymap.set
map("n", "<leader>-", function()
  require("oil").open()
end, { desc = "Open oil" })
