vim.pack.add({ "https://github.com/akinsho/bufferline.nvim" })
require("bufferline").setup({
  options = {
    offsets = {
      {
        filetype = "NvimTree",
        -- text = "", -- Optional label above the tree
        -- text_align = "left", -- "left" | "center" | "right"
        -- separator = true, -- Adds a vertical separator
      },
      {
        filetype = "toggleterm",
      },
    },
    custom_filter = function(buf_number)
      -- Hide terminal buffers
      if vim.bo[buf_number].buftype == "terminal" then
        return false
      end

      if vim.bo[buf_number].buftype == "nofile" then
        return false
      end

      return true
    end,
  },
})

vim.api.nvim_create_autocmd("UIEnter", {
  callback = function()
    if vim.bo.filetype ~= "" then
      return
    end
    if vim.api.nvim_buf_get_lines(0, 0, -1, false)[1] == "" then
      vim.api.nvim_buf_delete(0, { force = true })
    end
  end,
})

vim.api.nvim_create_autocmd("BufReadPost", {
  callback = function()
    local alt_buf = vim.fn.bufnr("#")

    -- Check if the alternate buffer is valid, loaded, and empty
    if alt_buf > 0 and vim.api.nvim_buf_is_loaded(alt_buf) then
      local name = vim.api.nvim_buf_get_name(alt_buf)
      local type = vim.api.nvim_get_option_value("buftype", { buf = alt_buf })
      local modified =
        vim.api.nvim_get_option_value("modified", { buf = alt_buf })
      local line_count = vim.api.nvim_buf_line_count(alt_buf)
      local first_line = vim.api.nvim_buf_get_lines(alt_buf, 0, 1, false)[1]
        or ""

      if
        name == ""
        and type == ""
        and not modified
        and line_count == 1
        and first_line == ""
      then
        -- Wipe out the buffer completely so it doesn't clutter your list
        vim.api.nvim_buf_delete(alt_buf, { force = true })
      end
    end
  end,
})
