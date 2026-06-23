vim.cmd("highlight NormalFloat guifg=#ded6d5 guibg=NONE")
vim.cmd("highlight FloatBorder guifg=#e3dcdc guibg=NONE")

require("vim._core.ui2").enable({})

local function carbonfox()
  vim.pack.add({ "https://github.com/edeneast/nightfox.nvim" })
  local nightfox = require("nightfox")
  nightfox.setup({})
  -- nightfox.compile()
  local scheme = "carbonfox" -- duskfox, nordfox, terafox, carbonfox
  vim.cmd("colorscheme " .. scheme)
end

local function onedark()
  vim.pack.add({
    "https://github.com/navarasu/onedark.nvim",
  })
  require("onedark").setup({
    style = "darker",
  })
  require("onedark").load()
end

local function catppuccin()
  vim.pack.add({
    { src = "https://github.com/catppuccin/nvim", name = "catppuccin" },
  })
  vim.cmd("colorscheme catppuccin-nvim")
end

local function kanagawa()
  vim.pack.add({ "https://github.com/rebelot/kanagawa.nvim" })
  vim.cmd("colorscheme kanagawa")
end

local function tokyonight()
  vim.pack.add({ "https://github.com/folke/tokyonight.nvim" })
  vim.cmd("colorscheme tokyonight-night")
end

local function github_dark()
  vim.pack.add({ "https://github.com/projekt0n/github-nvim-theme" })
  vim.cmd("colorscheme github_dark_default")
end

carbonfox()
