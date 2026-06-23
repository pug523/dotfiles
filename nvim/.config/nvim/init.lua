if vim.loader then
  vim.loader.enable()
end

local setup_async = true

require("options")

-- call `style` before `plugins` for some plugins that checks vim.g.color_scheme (e.g. lualine)
require("style")
require("mappings")

-- require("plugins")

local function setup_all()
  require("plugins")
  require("diagnostic")

  -- call after `plugins`, lsp requires nvim_cmp
  require("lsp")
end

if setup_async then
  vim.schedule(setup_all)
else
  setup_all()
end
