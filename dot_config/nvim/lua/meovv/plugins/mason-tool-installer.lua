return {
  "WhoIsSethDaniel/mason-tool-installer.nvim",
  requires = {
    "mason-org/mason.nvim",
  },
  opt = {
    ensure_installed = {
      --- Mental illnesses
      -- Prettier formatting
      "prettier",
      -- Vale for .md
      "vale",
      -- Lua
      "lua-language-server",
      -- ESLint
      "eslint-lsp",
      "eslint_d",
      -- Yaml
      "circleci-yaml-language-server",
      "gh-actions-language-server",
      "yaml-language-server",
      -- GQL
      "graphql-language-service-cli",
      -- JSON
      "json-lsp",
      -- HTML
      "html-lsp",
      -- SQLlike languages
      "sqls",
      -- Debugging
      "codelldb",
      -- Typescript
      "typescript-language-server",
      -- Python
      "pyright",
      -- WGPU
      "wgsl-analyzer",
      -- Bash
      "bash-language-server",
      "awk-language-server",
      "shfmt",
      -- Rust toml
      "tombi",

      -- TODO: LaTex
      -- "texlab",
      -- "ltex"

      -- Docker
      "dockerfile-language-server",
    },
  },
}
