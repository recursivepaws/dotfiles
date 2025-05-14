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
        "sqls",
        "codelldb",
        "typescript-language-server",
        "pyright",
        "wgsl-analyzer",
      },
    })
  end,
}
