local map = require("meovv.utils").map
local telescope = require("meovv.utils.lsp").telescope

-- Set session options
vim.o.sessionoptions = "buffers,curdir,folds,globals,tabpages,winpos,winsize"
-- Workspace
map("n", "<leader>wo", telescope("persisted"), { desc = "Load session" })
map("n", "<leader>wa", ":wall<cr>", { desc = "Write all buffers" })
map("n", "<leader>wq", ":wqall<cr>", { desc = "Write quit all buffers" })

return {
  "olimorris/persisted.nvim",
  event = "BufReadPre",
  opts = {
    ignored_dirs = {
      { "~", exact = true },
      { "/", exact = true },
    },
    use_git_branch = true,
  },
  config = function(_, opts)
    local persisted = require("persisted")
    persisted.branch = function()
      local branch = vim.fn.systemlist("git branch --show-current")[1]
      return vim.v.shell_error == 0 and branch or nil
    end
    persisted.setup(opts)

    -- Auto-start on empty Neovim
    vim.api.nvim_create_autocmd("VimEnter", {
      callback = function()
        if vim.fn.argc() == 0 then
          vim.defer_fn(function()
            require("telescope").extensions.persisted.persisted()
          end, 50)
        end
      end,
    })
  end,
}
