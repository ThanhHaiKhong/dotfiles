-- lua/lsp.lua
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

-- Swift: SourceKit-LSP
vim.lsp.config('sourcekit', {
  capabilities = capabilities,
  cmd = { "sourcekit-lsp" },
  filetypes = { "swift", "objective-c", "objective-cpp" },
  root_dir = vim.fs.root(0, { "Package.swift", ".git", "project.pbxproj" }),
})

-- Objective-C: clangd
vim.lsp.config('clangd', {
  capabilities = capabilities,
  cmd = { "clangd", "--background-index" },
  filetypes = { "c", "cpp", "objc", "objcpp" },
  root_dir = vim.fs.root(0, { "compile_commands.json", ".git" }),
})
