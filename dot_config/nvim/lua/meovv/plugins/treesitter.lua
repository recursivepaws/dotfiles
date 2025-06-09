return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = {
    "windwp/nvim-ts-autotag",
    "nvim-treesitter/nvim-treesitter-refactor",
  },
  event = "BufEnter",
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup({
      ensure_installed = {
        "astro",
        "bash",
        "css",
        "go",
        "html",
        "javascript",
        "jsdoc",
        "json",
        "lua",
        "markdown",
        "markdown_inline",
        "php",
        "python",
        "regex",
        "rust",
        "styled",
        "scss",
        "toml",
        "tsx",
        "typescript",
        "yaml",
      },
      auto_install = true,
      highlight = {
        enable = true,
        use_languagetree = true,
      },
      indent = {
        enable = true,
      },
      autotag = {
        enable = true,
      },
      refactor = {
        highlight_definitions = { enable = true },
        highlight_current_scope = { enable = false },
      },
    })
    -- Register octo as a markdown file
    vim.treesitter.language.register("markdown", "octo")
  end,
}
