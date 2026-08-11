vim.pack.add({
  "https://github.com/folke/snacks.nvim",
})
require("snacks").setup({
  bufdelete = {
    enabled = false,
    filter = function()
      return true
    end,
  },
})

local function is_protected_buf(buf)
  local ft = vim.bo[buf].filetype
  local bt = vim.bo[buf].buftype

  if
    ft == "NvimTree"
    or ft == "toggleterm"
    or bt == "terminal"
    or bt == "nofile"
  then
    return true
  end
  return false
end

local map = vim.keymap.set
map("n", "<leader>bd", function()
  if not is_protected_buf(vim.api.nvim_get_current_buf()) then
    Snacks.bufdelete.delete()
  end
end, { desc = "Delete Buffer" })

map("n", "<leader>bD", function()
  if not is_protected_buf(vim.api.nvim_get_current_buf()) then
    Snacks.bufdelete.delete({ force = true })
  end
end, { desc = "Delete Buffer (Force)" })

map("n", "<leader>bA", function()
  Snacks.bufdelete.all({
    filter = function(buf)
      return not is_protected_buf(buf)
    end,
  })
end, { desc = "Delete All Buffers (Keep NvimTree/ToggleTerm)" })
