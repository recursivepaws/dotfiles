local mason_bin = require("meovv.utils.lsp").mason_bin
return {
  "stevearc/conform.nvim",
  config = function()
    require("conform").setup({
      formatters = {
        prettier = {
          command = mason_bin .. "prettier",
          args = { "--stdin-filepath", "$FILENAME" },
        },
        cwd = require("conform.util").root_file({
          ".prettierrc",
          ".prettierrc.json",
          ".prettierrc.js",
          "prettier.config.js",
          "package.json",
        }),
      },
      formatters_by_ft = {
        javascript = { "prettier" },
        javascriptreact = { "prettier" },
        typescript = { "prettier" },
        typescriptreact = { "prettier" },
        css = { "prettier" },
        json = { "prettier" },
        jsonc = { "prettier" },
        yaml = { "prettier" },
        lua = { "stylua" },
        -- rust = { "lsp" }, -- rustaceanvim provides LSP formatting via rust-analyzer
        sql = {},
        sh = { "shfmt" },
        zsh = { "shfmt" },
      },
      format_on_save = {
        timeout_ms = 2000,
        lsp_fallback = false,
      },
    })
  end,
}
