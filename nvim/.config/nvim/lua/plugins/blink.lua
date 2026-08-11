vim.pack.add({
  "https://github.com/saghen/blink.lib",
  "https://github.com/saghen/blink.cmp",
})

function setup()
  local cmp = require("blink.cmp")
  cmp.build():pwait()
  cmp.setup({
    fuzzy = { implementation = "prefer_rust_with_warning" },
    keymap = {
      preset = "none",

      ["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
      ["<C-e>"] = { "hide" },

      ["<CR>"] = { "accept", "fallback" },

      ["<Tab>"] = { "select_next", "snippet_forward", "fallback" },
      ["<S-Tab>"] = { "select_prev", "snippet_backward", "fallback" },

      ["<Up>"] = { "select_prev", "fallback" },
      ["<Down>"] = { "select_next", "fallback" },
      ["<C-p>"] = { "select_prev", "fallback" },
      ["<C-n>"] = { "select_next", "fallback" },
    },

    completion = {
      documentation = { auto_show = true, auto_show_delay_ms = 200 },
      ghost_text = { enabled = false },
      accept = {
        auto_brackets = { enabled = true },
      },
      list = {
        selection = {
          preselect = false,
          auto_insert = false,
        },
      },
    },
  })
end

-- vim.schedule(setup)
setup()
