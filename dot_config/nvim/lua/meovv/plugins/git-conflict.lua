local map = require("meovv.utils").set_keymap
return {
  "akinsho/git-conflict.nvim",
  version = "*",
  opts = {
    default_mappings = false,
    highlights = {
      incoming = "DiffText",
      current = "DiffText",
    },
  },
  init = function()
    map("n", "<leader>go", ":GitConflictChooseOurs<cr>", { desc = "Choose ours" })
    map("n", "<leader>gt", ":GitConflictChooseTheirs<cr>", { desc = "Choose theirs" })
    map("n", "<leader>ga", ":GitConflictChooseBoth<cr>", { desc = "Choose AND" })
    map("n", "<leader>g0", ":GitConflictChooseNone<cr>", { desc = "Choose none" })
    map("n", "<leader>g[", ":GitConflictPrevConflict<cr>", { desc = "Prev conflict" })
    map("n", "<leader>g]", ":GitConflictNextConflict<cr>", { desc = "Next conflict" })
  end,
  config = true,
}
