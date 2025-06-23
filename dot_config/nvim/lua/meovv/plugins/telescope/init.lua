-- Improved file search

local icons = require("meovv.utils.icons")
-- Added cmdline via telescope
return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "kdheepak/lazygit.nvim",
    "nvim-lua/popup.nvim",
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
    },
    "nvim-telescope/telescope-ui-select.nvim",
  },
  config = function()
    require("meovv.plugins.telescope.config")
  end,
  init = function()
    require("telescope").setup({
      pickers = {
        lsp_references = {
          theme = "dropdown",
        },
      },
      extensions = {
        ["ui-select"] = {
          require("telescope.themes").get_dropdown({ winblend = 10 }),
        },
      },

      prompt_prefix = "🔍 ",
      selection_caret = icons.folder.arrow_closed,
      file_ignore_patterns = {
        ".git/",
        "node_modules/",
        "__snapshots__/",
        "*.ipynb",
      },
      dynamic_preview_title = true,
    })

    require("telescope").load_extension("ui-select")
    require("telescope").load_extension("fzf")
    require("telescope").load_extension("lazygit")

    -- normal mappings
    local map = require("meovv.utils").map
    local telescope = require("meovv.utils.lsp").telescope
    local t = require("meovv.plugins.telescope.utils")
    local project_files, project_grep, git_root = t.project_files, t.project_grep, t.git_root

    map("n", "<leader>fp", project_files, { desc = "Find project file" })
    map("n", "<leader>fg", project_grep, { desc = "Grep whole project" })
    map("n", "<leader>ff", telescope("find_files"), { desc = "Find file" })
    map("n", "<leader>fc", telescope("commands"), { desc = "Find commands" })
    map("n", "<leader>fk", telescope("keys"), { desc = "Find keymappings" })
    map("n", "<leader>fs", telescope("live_grep"), { desc = "Grep string" })
    map("n", "<leader>ft", telescope("treesitter"), { desc = "Grep treesitter" })
    map("n", "<leader>fh", telescope("help_tags theme=ivy"), { desc = "Find Help" })
    map("n", "<leader>fm", telescope("treesitter symbols=function"), { desc = "Grep methods" })
    map("n", "<leader>fb", telescope("buffers"), { desc = "Find buffer" })
    map("n", "<leader>fw", telescope("grep_string"), { desc = "Grep current word" })

    if git_root() then
      map("n", "<leader>fc", telescope("git_commits"), { desc = "Git commits" })
      -- map("n", "<leader>fs", telescope("git_status"), { desc = "Git status" })
      -- map("n", "<leader>fb", telescope("git_branches"), { desc = "Git branches" })
    end
  end,
  lazy = false,
}
