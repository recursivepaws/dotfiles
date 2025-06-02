return {
  "stevearc/conform.nvim",
  config = function()
    require("conform").setup({
      formatters_by_ft = {
        javascript = { "prettier", "lsp" },
        javascriptreact = { "prettier", "lsp" },
        typescript = { "prettier", "lsp" },
        typescriptreact = { "prettier", "lsp" },
        json = { "prettier", "lsp" },
        yaml = { "prettier", "lsp" },
        lua = { "stylua", "lsp" },
        rust = { "lsp" }, -- rustaceanvim provides LSP formatting via rust-analyzer
      },
      format_on_save = {
        lsp_fallback = true,
      },
    })
  end,
}
