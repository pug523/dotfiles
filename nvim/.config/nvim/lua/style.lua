require("vim._core.ui2").enable({})

local function carbonfox(scheme)
  vim.pack.add({ "https://github.com/edeneast/nightfox.nvim" })
  local nightfox = require("nightfox")
  nightfox.setup({
    options = {
      transparent = true,
    },
    groups = {
      all = {
        DiagnosticError = { fg = "palette.red", style = "bold" },
        DiagnosticWarn = { fg = "palette.yellow" },
        DiagnosticInfo = { fg = "palette.blue" },
        DiagnosticHint = { fg = "palette.cyan" },
        DiagnosticVirtualTextError = { bg = "palette.red", fg = "palette.bg0" },
      },
    },
  })
  -- nightfox.compile()
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

carbonfox("carbonfox") -- duskfox, nordfox, terafox, carbonfox

vim.api.nvim_set_hl(0, "NormalFloat", { fg = "#ded6d5", bg = "NONE" })
vim.api.nvim_set_hl(0, "FloatBorder", { fg = "#e3dcdc", bg = "NONE" })
vim.api.nvim_set_hl(0, "Visual", { bg = "#3b4252", fg = "NONE" })
