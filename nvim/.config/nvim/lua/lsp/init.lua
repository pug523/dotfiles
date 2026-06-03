local lsp = vim.lsp

-- local capabilities = require("cmp_nvim_lsp").default_capabilities()
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local function on_attach(client, bufnr)
  if client:supports_method("textDocument/completion") then
    lsp.completion.enable(true, client.id, bufnr, { autotrigger = true })
  end

  local opts = { buffer = bufnr, silent = true }
  local map = vim.keymap.set
  local buf = lsp.buf
  -- map("n", "gd", lsp.buf.definition, opts)
  -- map("n", "K", lsp.buf.hover, opts)
  -- map("n", "gi", lsp.buf.implementation, opts)
  -- map("n", "gD", lsp.buf.declaration, opts)
  -- map("n", "gr", lsp.buf.references, opts)
  map("n", "K", buf.hover, opts)
  map("n", "gd", buf.definition, opts)
  map("n", "gD", buf.declaration, opts)
  map("n", "gi", buf.implementation, opts)
  map("n", "go", buf.type_definition, opts)
  map("n", "gr", buf.references, opts)
  map("n", "gs", buf.signature_help, opts)
end

lsp.config("*", {
  capabilities = capabilities,
  on_attach = on_attach,
  root_markers = { ".git" },
})

local lsp_servers = {
  "clangd",
  "lua_ls",
  "rust_analyzer",
  "pyright",
  "zls",
}

require("lsp.clangd")
require("lsp.lua_ls")

lsp.enable(lsp_servers)
