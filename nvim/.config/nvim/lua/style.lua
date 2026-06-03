-- nightfox (carbonfox)
vim.pack.add({ "https://github.com/edeneast/nightfox.nvim" })
require("nightfox").setup({})

vim.cmd("colorscheme carbonfox")

vim.cmd("highlight NormalFloat guifg=#ded6d5 guibg=NONE")
vim.cmd("highlight FloatBorder guifg=#e3dcdc guibg=NONE")

require("vim._core.ui2").enable({})

-- onedark
-- vim.pack.add({
--   "https://github.com/navarasu/onedark.nvim",
-- })
-- require("onedark").setup({
--   style = "darker",
-- })
-- require("onedark").load()

-- catppuccin
-- vim.pack.add({
--   { src = "https://github.com/catppuccin/nvim", name = "catppuccin" },
-- })
-- vim.cmd("colorscheme catppuccin-nvim")

-- kanagawa
-- vim.pack.add({ "https://github.com/rebelot/kanagawa.nvim" })
-- vim.cmd("colorscheme kanagawa")

-- tokyodark
-- vim.pack.add({ "https://github.com/folke/tokyonight.nvim" })
-- vim.cmd("colorscheme tokyonight-night")
