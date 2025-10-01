return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = {
    "windwp/nvim-ts-autotag",
  },
  lazy = false,
  branch = "main",
  event = "BufEnter",
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter").install({
      -- real
      "bash",
      "json",
      "lua",
      "swift",
      -- "luadoc",
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

      -- Required for getting most of the `todo-comments` working
      "comment",

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

      "nix",

      -- maybe in the future
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
    })
    -- require("nvim-treesitter.configs").setup({
    -- 	modules = {},
    -- 	sync_install = true,
    -- 	ignore_install = {},
    -- 	auto_install = true,
    -- 	highlight = {
    -- 		enable = true,
    -- 		use_languagetree = true,
    -- 	},
    -- 	indent = {
    -- 		enable = true,
    -- 	},
    -- 	autotag = {
    -- 		enable = true,
    -- 	},
    -- 	refactor = {
    -- 		highlight_definitions = { enable = true },
    -- 		highlight_current_scope = { enable = false },
    -- 	},
    -- })
    -- Register octo as a markdown file
    vim.treesitter.language.register("markdown", "octo")

    -- TODO: Maybe we want these ? see what else is new on the new version of treesitter
    -- vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
    -- vim.api.nvim_create_autocmd('FileType', {
    --   pattern = { '<filetype>' },
    --   callback = function() vim.treesitter.start() end,
    -- })
  end,
}
