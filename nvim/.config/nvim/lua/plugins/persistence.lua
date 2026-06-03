vim.pack.add({
  "https://github.com/folke/persistence.nvim",
})
require("persistence").setup({})

local persistence_group =
  vim.api.nvim_create_augroup("PersistenceConfig", { clear = true })

vim.api.nvim_create_autocmd("User", {
  pattern = "PersistenceSavePre",
  group = persistence_group,
  callback = function()
    require("nvim-tree.api").tree.close()
  end,
})
