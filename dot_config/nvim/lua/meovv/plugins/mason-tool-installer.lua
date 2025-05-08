return {
  "WhoIsSethDaniel/mason-tool-installer.nvim",
  requires = {
    "williamboman/mason.nvim",
  },
  config = function()
    require("mason-tool-installer").setup({
      ensure_installed = {
        "prettier",
        "vale",
        "lua-language-server",
        "eslint-lsp",
        "json-lsp",
        "html-lsp",
        "codelldb",
        "typescript-language-server",
        "pyright"
      },
    })
  end,
}
