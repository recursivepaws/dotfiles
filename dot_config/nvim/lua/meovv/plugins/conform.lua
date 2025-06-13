return {
  "stevearc/conform.nvim",
  config = function()
    require("conform").setup({
      formatters_by_ft = {
        javascript = { "prettier" },
        javascriptreact = { "prettier" },
        typescript = { "prettier" },
        typescriptreact = { "prettier" },
        css = { "prettier" },
        json = { "prettier" },
        yaml = { "prettier" },
        lua = { "stylua" },
        -- rust = { "lsp" }, -- rustaceanvim provides LSP formatting via rust-analyzer
        sh = { "shfmt" },
        zsh = { "shfmt" },
      },
      format_on_save = {
        lsp_fallback = true,
      },
    })
  end,
}
