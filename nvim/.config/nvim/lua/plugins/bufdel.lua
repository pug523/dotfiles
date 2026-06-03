-- vim.pack.add({ "https://github.com/ojroques/nvim-bufdel" })
-- require("bufdel").setup({})

-- define manually
-- vim.api.nvim_create_user_command("Bdel", function()
--   local bufnr = vim.api.nvim_get_current_buf()
--   vim.cmd("bprevious")
--   vim.cmd("bd " .. bufnr)
-- end, {})

vim.api.nvim_create_user_command("Bdel", function()
  local bufnr = vim.api.nvim_get_current_buf()

  local buftype = vim.api.nvim_get_option_value("buftype", { buf = bufnr })
  if buftype ~= "" then
    -- buftype is something like nofile, terminal, etc; skip
    return
  end

  local modified = vim.api.nvim_get_option_value("modified", { buf = bufnr })
  if modified then
    -- not saved; cancel
    return
  end

  local buflist = vim.fn.getbufinfo({ buflisted = 1 })
  if #buflist > 1 then
    -- move to previous buffer, and delete this
    vim.cmd("bprevious")
    vim.cmd("confirm bd " .. bufnr)
  else
    -- if this is last buffer -> create new one, and delete this
    vim.cmd("enew")
    vim.cmd("confirm bd " .. bufnr)
  end
end, {})
