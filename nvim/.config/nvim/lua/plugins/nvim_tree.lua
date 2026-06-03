vim.pack.add({ "https://github.com/nvim-tree/nvim-tree.lua" })

local options = {
  -- https://github.com/nvim-tree/nvim-tree.lua/blob/master/lua/nvim-tree/config.lua
  sync_root_with_cwd = true,
  respect_buf_cwd = true,
  update_focused_file = {
    enable = false,
    update_root = true,
  },
  renderer = {
    special_files = {
      "Cargo.toml",
      "Makefile",
      "CMakeLists.txt",
      "README.md",
      "LICENSE",
      "xmake.lua",
      "build.zig",
      "build.al",
    },
    icons = {
      git_placement = "after",
    },
  },
  view = {
    width = 35,
    number = true,
    relativenumber = false,
    preserve_window_proportions = true,
  },
  actions = {
    file_popup = {
      open_win_config = {
        border = "rounded",
      },
    },
    open_file = {
      resize_window = true,
      window_picker = {
        exclude = {
          filetype = {
            "notify",
            "packer",
            "qf",
            "diff",
            "fugitive",
            "fugitiveblame",
            "toggleterm",
          },
          buftype = { "nofile", "terminal", "help" },
        },
      },
    },
  },
}

require("nvim-tree").setup(options)
