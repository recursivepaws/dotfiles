local function tsls()
  local mason_bin = vim.fn.expand("$HOME/.local/share/nvim/mason/bin/")

  vim.lsp.config("tsls", {
    cmd = { mason_bin .. "typescript-language-server", "--stdio" },
    filetypes = {
      "typescript",
      "typescriptreact",
      "typescript.tsx",
      "typescript.tsx",
    },
    root_markers = {
      -- "tsconfig.json"
      ".git"
    }
  })
  vim.lsp.enable("tsls")
end
return tsls
