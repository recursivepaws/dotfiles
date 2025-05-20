local mason_bin = require("meovv.utils.lsp").mason_bin

vim.lsp.config("html", {
  cmd = { mason_bin .. "vscode-html-language-server", "--stdio" },
  filetypes = {
    "htmlangular",
    "html",
    "templ",
  },
})

vim.lsp.enable("html")
