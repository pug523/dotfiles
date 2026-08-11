vim.pack.add({ "https://github.com/nvim-treesitter/nvim-treesitter" })

local options = {
  ensure_installed = {
    "bash",
    "c",
    "cmake",
    "cpp",
    -- "fish",
    "glsl",
    "gn",
    "go",
    -- "gomod",
    -- "gosum",
    -- "gotmpl",
    -- "gowork",
    -- "haskell",
    "hlsl",
    "javascript",
    "lua",
    "luadoc",
    "make",
    "markdown",
    "markdown_inline",
    -- "odin",
    "printf",
    "python",
    "rust",
    "slang",
    "toml",
    "typescript",
    "vim",
    "vimdoc",
    "yaml",
    "zig",
  },

  highlight = {
    enable = true,
  },

  indent = { enable = true },
}

vim.filetype.add({
  extension = {
    al = "alcy",
    alcf = "alcy_config",
  },
})

vim.filetype.add({
  extension = {
    gni = "gn",
  },
  filename = {
    ["BUILD.gn"] = "gn",
  },
})

vim.treesitter.language.register("rust", { "alcy", "alcf" })
-- vim.treesitter.language.register("cpp")
vim.treesitter.language.register(
  "glsl",
  { "vsh", "fsh", "vert", "frag", "geom", "comp" }
)

require("nvim-treesitter.config").setup(options)
require("nvim-treesitter").setup({})
