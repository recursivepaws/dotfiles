local mason_bin = require("utils.lsp").mason_bin

vim.lsp.config("biome", {
  cmd = { "pnpm", "biome", "lsp-proxy" },
  filetypes = {
    "javascript",
    "javascriptreact",
    "typescript",
    "typescriptreact",
    "json",
  },
  root_markers = { "biome.json", ".biome.json", "package.json", ".git" },
  single_file_support = true,
})

vim.lsp.enable("biome")
