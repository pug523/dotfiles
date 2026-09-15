vim.lsp.config["clangd"] = {
  cmd = {
    "clangd",
    "--background-index",
    "-j=8",
    "--query-driver=clang",
    "--clang-tidy",
    "--completion-style=detailed",
    "--header-insertion=iwyu",
  },
  root_markers = { ".clangd", "compile_commands.json" },
  filetypes = { "c", "cpp" },
  on_attach = vim.lsp.config["*"].on_attach,
}
