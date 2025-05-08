local function prettier()
  local mason_bin = vim.fn.expand("$HOME/.local/share/nvim/mason/bin/")

  vim.lsp.config("prettier", {
    cmd = { mason_bin .. "prettier" },
    filetypes = {
      "htmlangular",
      "scss",
      "css",
      "html",
      "templ",
      "javascript",
      "javascriptreact",
      "javascript.jsx",
      "typescript",
      "typescriptreact",
      "typescript.tsx",
      "vue",
      "svelte",
    },
    root_markers = {
      -- ".prettierignore",
      -- ".prettierrc"
      ".git"
    }
  })
  vim.lsp.enable("prettier")
end
return prettier
