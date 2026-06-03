local g = vim.g
local o = vim.o
local opt = vim.opt

o.number = true
o.relativenumber = true
o.ignorecase = true
o.smartcase = true
o.expandtab = true
o.tabstop = 2
o.shiftwidth = 2
o.softtabstop = 2
o.cursorline = true
-- o.cursorlineopt = "both"
o.cursorlineopt = "number"
o.splitbelow = true
o.splitright = true

-- floating window borders
o.pumborder = "rounded"
o.winborder = "rounded"

-- use clipboard
opt.clipboard = "unnamedplus"

opt.completeopt = {
  "menu",
  "menuone",
  "noselect",
  "fuzzy",
  "popup",
}

opt.termguicolors = true
opt.laststatus = 3

opt.wrap = false
opt.linebreak = false

g.loaded_python3_provider = 0
g.loaded_ruby_provider = 0
g.loaded_node_provider = 0
g.loaded_perl_provider = 0

g.loaded_netrw = 1
g.loaded_netrwPlugin = 1

g.loaded_remote_plugins = 1

g.loaded_tutor_mode_plugin = 1

g.loaded_getscript = 1
g.loaded_getscriptPlugin = 1
g.loaded_vimball = 1
g.loaded_vimballPlugin = 1

g.loaded_gzip = 1
g.loaded_tar = 1
g.loaded_tarPlugin = 1
g.loaded_zip = 1
g.loaded_zipPlugin = 1

g.loaded_logipat = 1

g.loaded_rrhelper = 1
