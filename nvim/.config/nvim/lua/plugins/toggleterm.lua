vim.pack.add({ "https://github.com/akinsho/toggleterm.nvim" })
require("toggleterm").setup({
  size = function(term)
    if term.direction == "vertical" then
      return vim.o.columns * 0.3
    elseif term.direction == "horizontal" then
      return 15
    else
      return 20
    end
  end,
  open_mapping = [[<C-t>]],
  shade_filetypes = {},
  start_in_insert = false,
  persist_size = true,
  persist_mode = true,
  direction = "horizontal", -- "vertical" | "horizontal" | "tab" | "float"
  close_on_exit = true,
  auto_scroll = false,

  float_opts = {
    -- The border key is *almost* the same as 'nvim_open_win'
    -- see :h nvim_open_win for details on borders however
    -- the 'curved' border is a custom border type
    -- not natively supported but implemented in this plugin.
    border = "curved", -- 'single' | 'double' | 'shadow' | 'curved' |
    -- width = <value>,
    -- height = <value>,
    -- row = <value>,
    -- col = <value>,
    winblend = 10,
    -- zindex = <value>,
    title_pos = "left", -- 'left' | 'center' | 'right', position of the title of the floating window
  },
})
