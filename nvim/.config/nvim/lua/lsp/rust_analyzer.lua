vim.lsp.config["rust_analyzer"] = {
  root_markers = { "Cargo.toml", "Cargo.lock" },
  filetypes = { "rust" },
  settings = {
    ["rust-analyzer"] = {
      check = {
        command = "clippy",
      },
    },
  },
  on_attach = vim.lsp.config["*"].on_attach,
}
