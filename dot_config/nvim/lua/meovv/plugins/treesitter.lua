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
        -- real
        "bash",
        "json",
        "lua",
        "luadoc",
        "markdown",
        "markdown_inline",
        "toml",
        "yaml",
        "kdl",
        "sql",
        "wgsl",
        "glsl",
        "xml",
        "ssh_config",
        "rust",
        "regex",
        "python",
        "perl",
        -- "latex",
        "graphql",

        "gitattributes",
        "gitcommit",
        "gitignore",
        "git_config",
        "git_rebase",

        "dockerfile",
        "rust",
        "csv",

        -- maybe in the future
        -- "nix"
        -- "make"

        -- fake
        "astro",
        "css",
        "scss",
        "go",
        "html",
        "javascript",
        "jsdoc",
        "php",
        "styled",
        "tsx",
        "typescript",
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
