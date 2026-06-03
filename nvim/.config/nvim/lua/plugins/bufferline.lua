vim.pack.add({ "https://github.com/akinsho/bufferline.nvim" })
require("bufferline").setup({
  options = {
    offsets = {
      {
        filetype = "NvimTree",
        -- text = "", -- Optional label above the tree
        -- text_align = "left", -- "left" | "center" | "right"
        -- separator = true, -- Adds a vertical separator
      },
      {
        filetype = "toggleterm",
      },
    },
  },
})
