vim.pack.add({ "https://github.com/mfussenegger/nvim-dap" })

local dap = require("dap")
dap.adapters.lldb = {
  type = "executable",
  command = "lldb-dap",
  name = "lldb",
}

local lldb_config = {
  {
    name = "Launch Target",
    type = "lldb",
    request = "launch",
    program = function()
      return vim.fn.input(
        "Path to executable: ",
        vim.fn.getcwd() .. "/",
        "file"
      )
    end,
    cwd = "${workspaceFolder}",
    stopOnEntry = false,
    args = {},
  },
}

dap.configurations.c = lldb_config
dap.configurations.cpp = lldb_config
dap.configurations.rust = lldb_config

-- local map = vim.keymap.set
-- map("n", "<F5>", function()
--   require("dap").continue()
-- end)
-- map("n", "<F10>", function()
--   require("dap").step_over()
-- end)
-- map("n", "<F11>", function()
--   require("dap").step_into()
-- end)
-- map("n", "<F12>", function()
--   require("dap").step_out()
-- end)
-- map("n", "<Leader>b", function()
--   require("dap").toggle_breakpoint()
-- end)
