local xmake_lua_path =
  vim.fn.expand("~/.local/share/xmake_ls/resources/std/xmake/")

vim.lsp.config["lua_ls"] = {
  settings = {
    Lua = {
      runtime = {
        version = "LuaJIT",
        pathStrict = true,
        path = { "?.lua", "?/init.lua" },
      },
      workspace = {
        library = vim.list_extend(vim.api.nvim_get_runtime_file("lua", true), {
          "${3rd}/luv/library",
          "${3rd}/busted/library",
          "${3rd}/luassert/library",
          xmake_lua_path,
        }),
        checkThirdParty = "Disable",
      },
    },
  },
  on_attach = vim.lsp.config["*"].on_attach,
}
