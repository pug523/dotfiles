-- vim.pack.add({ "https://github.com/ojroques/nvim-bufdel" })
-- require("bufdel").setup({})

-- define manually
-- vim.api.nvim_create_user_command("Bdel", function()
--   local bufnr = vim.api.nvim_get_current_buf()
--   vim.cmd("bprevious")
--   vim.cmd("bd " .. bufnr)
-- end, {})

vim.api.nvim_create_user_command("Bdel", function()
  local cur_buf = vim.api.nvim_get_current_buf()

  local modified = vim.api.nvim_get_option_value("modified", { buf = cur_buf })
  local force = false

  if modified then
    local choice = vim.fn.confirm("Save changes?", "&Yes\n&No\n&Cancel")
    if choice == 1 then
      local success, _ = pcall(function()
        vim.api.nvim_buf_call(cur_buf, function()
          vim.cmd("write")
        end)
      end)
      if not success then
        vim.notify(
          "Write failed, aborting buffer deletion.",
          vim.log.levels.ERROR
        )
        return
      end
    elseif choice == 2 then
      force = true
    else
      return
    end
  end

  local next_buf = nil
  local buflist = vim.fn.getbufinfo({ buflisted = 1 })
  local cur_idx = nil

  for i, buf in ipairs(buflist) do
    if buf.bufnr == cur_buf then
      cur_idx = i
      break
    end
  end

  if cur_idx then
    local target = buflist[cur_idx + 1] or buflist[cur_idx - 1]
    if target then
      next_buf = target.bufnr
    end
  end

  local windows = vim.fn.win_findbuf(cur_buf)
  for _, win in ipairs(windows) do
    vim.api.nvim_win_call(win, function()
      if next_buf and vim.api.nvim_buf_is_valid(next_buf) then
        vim.api.nvim_set_current_buf(next_buf)
      else
        local new_buf = vim.api.nvim_create_buf(true, false)
        vim.api.nvim_set_current_buf(new_buf)
      end
    end)
  end

  pcall(function()
    local cmd = force and string.format("bdelete! %d", cur_buf)
      or string.format("bdelete %d", cur_buf)
    vim.cmd(cmd)
  end)
end, {})
