vim.lsp.config["clangd"] = {
  cmd = { "clangd", "--background-index", "--clang-tidy" },
  root_markers = { ".clangd", "compile_commands.json" },
  filetypes = { "c", "cpp" },
  on_attach = vim.lsp.config["*"].on_attach,
}
