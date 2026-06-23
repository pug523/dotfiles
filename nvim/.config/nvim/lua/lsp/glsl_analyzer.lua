vim.lsp.config["glsl_analyzer"] = {
  filetypes = { "vsh", "fsh", "vert", "frag", "geom", "comp" },
  on_attach = vim.lsp.config["*"].on_attach,
}
