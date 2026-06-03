vim.pack.add({
  "https://github.com/saghen/blink.lib",
  "https://github.com/saghen/blink.cmp",
})

function setup()
  local cmp = require("blink.cmp")
  cmp.build():pwait()
  cmp.setup({
    fuzzy = { implementation = "prefer_rust_with_warning" },
  })
end

-- vim.schedule(setup)
setup()
