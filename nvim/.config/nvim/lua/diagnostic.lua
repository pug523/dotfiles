-- vim.diagnostic.config({
--   update_in_insert = false,
--   float = { border = "rounded" },
--   virtual_text = {
--     prefix = function(diagnostic)
--       if diagnostic.severity == vim.diagnostic.severity.ERROR then
--         return ""
--       elseif diagnostic.severity == vim.diagnostic.severity.WARN then
--         return ""
--       elseif diagnostic.severity == vim.diagnostic.severity.INFO then
--         return ""
--       elseif diagnostic.severity == vim.diagnostic.severity.HINT then
--         return ""
--       else
--         return ""
--       end
--     end,
--     format = function(diagnostic)
--       return string.format(
--         "%s (%s: %s)",
--         diagnostic.message,
--         diagnostic.source,
--         diagnostic.code
--       )
--     end,
--     source = "if_many",
--   },
--   signs = {
--     text = {
--       [vim.diagnostic.severity.ERROR] = "",
--       [vim.diagnostic.severity.WARN] = "",
--       [vim.diagnostic.severity.INFO] = "",
--       [vim.diagnostic.severity.HINT] = "",
--     },
--   },
-- })
local icons = {
  [vim.diagnostic.severity.ERROR] = " ",
  [vim.diagnostic.severity.WARN] = " ",
  [vim.diagnostic.severity.INFO] = " ",
  [vim.diagnostic.severity.HINT] = " ",
}

vim.diagnostic.config({
  update_in_insert = false,
  float = { border = "rounded" },
  virtual_text = {
    prefix = function(diagnostic)
      return icons[diagnostic.severity] or "● "
    end,
    format = function(diagnostic)
      if diagnostic.code then
        return string.format(
          "%s (%s: %s)",
          diagnostic.message,
          diagnostic.source,
          diagnostic.code
        )
      elseif diagnostic.source then
        return string.format("%s (%s)", diagnostic.message, diagnostic.source)
      end
      return diagnostic.message
    end,
  },
  signs = {
    text = icons,
  },
})
