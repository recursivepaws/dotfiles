vim.lsp.config("tsgo", {
  cmd = {
    "pnpm",
    "tsgo",
    "--lsp",
    "-stdio",
  },
  filetypes = {
    "javascript",
    "javascriptreact",
    "javascript.jsx",
    "typescript",
    "typescriptreact",
    "typescript.tsx",
  },
  root_markers = { "tsconfig.json" },
})

vim.lsp.enable("tsgo")
