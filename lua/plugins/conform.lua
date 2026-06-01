local mason_bin = require("utils.lsp").mason_bin
return {
  "stevearc/conform.nvim",
  config = function()
    -- Determine which prettier command to use
    local prettier_cmd, prettier_args

    -- Check if pnpm and prettier are both available
    if vim.fn.executable("pnpm") == 1 then
      -- vim.notify("pnpm is in the path")
      vim.fn.system("pnpm exec prettier --version")
      if vim.v.shell_error == 0 then
        -- vim.notify("prettier version check succeed")
        prettier_cmd = "pnpm"
        prettier_args = { "exec", "prettier", "--stdin-filepath", "$FILENAME" }
      else
        -- vim.notify("prettier version check failed")
        prettier_cmd = mason_bin .. "prettier"
        prettier_args = { "--stdin-filepath", "$FILENAME" }
      end
    else
      vim.notify("pnpm is not in the path")
      prettier_cmd = mason_bin .. "prettier"
      prettier_args = { "--stdin-filepath", "$FILENAME" }
    end

    require("conform").setup({
      formatters = {
        prettier = {
          command = prettier_cmd,
          args = prettier_args,
        },
        -- prettier = {
        --   command = function()
        --     local result = vim.fn.system("pnpm bin ls 2>&1")
        --
        --     if vim.v.shell_error == 0 and result:match("prettier") then
        --       return "pnpm exec prettier"
        --     end
        --
        --     -- Fallback to mason
        --     return mason_bin .. "prettier"
        --   end,
        --   args = { "--stdin-filepath", "$FILENAME" },
        -- },
        cwd = require("conform.util").root_file({
          ".prettierrc",
          ".prettierrc.json",
          ".prettierrc.js",
          "prettier.config.js",
          "package.json",
        }),
      },
      formatters_by_ft = {
        -- rust = { "rustfmt" },
        javascript = { "prettier" },
        javascriptreact = { "prettier" },
        typescript = { "prettier" },
        typescriptreact = { "prettier" },
        css = { "prettier" },
        json = { "prettier" },
        jsonc = { "prettier" },
        yaml = { "prettier" },
        lua = { "stylua" },
        nix = { "nixfmt" },
        sql = {},
        sh = { "shfmt" },
        zsh = { "shfmt" },
        typst = { "typstyle" },
      },
      format_on_save = {
        timeout_ms = 2000,
        lsp_fallback = false,
      },
    })
  end,
}
