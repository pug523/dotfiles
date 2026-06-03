vim.pack.add({ "https://github.com/nvim-treesitter/nvim-treesitter" })

local options = {
  ensure_installed = {
    "bash",
    "c",
    "cmake",
    "cpp",
    -- "fish",
    "go",
    -- "gomod",
    -- "gosum",
    -- "gotmpl",
    -- "gowork",
    -- "haskell",
    "javascript",
    "lua",
    "luadoc",
    "make",
    "markdown",
    -- "odin",
    "printf",
    "python",
    "rust",
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

vim.treesitter.language.register("rust", { "alcy", "alcf" })
-- vim.treesitter.language.register("cpp")

require("nvim-treesitter.config").setup(options)
require("nvim-treesitter").setup({})
