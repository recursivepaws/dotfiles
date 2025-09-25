local map = require("meovv.utils").map
local telescope = require("meovv.utils.lsp").telescope
local git_root = require("meovv.utils").git_root

-- Set session options
vim.o.sessionoptions = "buffers,curdir,folds,globals,tabpages,winpos,winsize"
-- Workspace
map("n", "<leader>wo", telescope("persisted"), { desc = "Load session" })
map("n", "<leader>wb", telescope("git_branches"), { desc = "Switch branch" })
map("n", "<leader>wa", ":wall<cr>", { desc = "Write all buffers" })
map("n", "<leader>wq", ":wqall<cr>", { desc = "Write quit all buffers" })

return {
  "olimorris/persisted.nvim",
  event = "BufReadPre",
  -- opts = ,
  config = function(_, opts)
    local p = require("persisted")
    p.branch = function()
      local branch = vim.fn.systemlist("git branch --show-current")[1]
      return vim.v.shell_error == 0 and branch or nil
    end
    p.setup({
      ignored_dirs = {
        { "~",                     exact = true },
        { "/",                     exact = true },
        { "~/Documents/hightouch", exact = true },
        { "~/Documents",           exact = true },
      },
      use_git_branch = true,
    })

    -- Auto-start on empty Neovim
    vim.api.nvim_create_autocmd("VimEnter", {
      callback = function()
        if vim.fn.argc() == 0 then
          vim.defer_fn(function()
            telescope("persisted")()
          end, 50)
        end
      end,
    })

    vim.api.nvim_create_autocmd("User", {
      pattern = "PersistedTelescopeLoadPre",
      callback = function(session)
        -- Save the currently loaded session passing in the path to the current session
        require("persisted").save({ session = vim.g.persisted_loaded_session })

        -- Delete all of the open buffers
        vim.api.nvim_input("<ESC>:%bd!<CR>")
      end,
    })

    vim.api.nvim_create_autocmd("User", {
      pattern = "PersistedLoadPost",
      callback = function(e)
        local session_dir = vim.fn.getcwd()
        local temp_file = os.getenv("HOME") .. "/.local/state/nvim/cwd"
        local file = io.open(temp_file, "w")
        if file then
          file:write(session_dir)
          file:close()
          vim.notify("Saved cwd")
        end

        local persisted = require("persisted")

        -- Get the branch from the loaded session filename, not current git branch
        local session_branch = nil
        local current_session = persisted.current()

        if current_session then
          -- Extract branch from session filename (format: project@@branch.vim)
          local filename = vim.fn.fnamemodify(vim.g.persisted_loaded_session, ":t:r") -- get filename without extension
          local parts = vim.split(filename, "@@")
          if #parts >= 2 then
            session_branch = parts[2]:gsub("%%", "/")
          end
        end

        if session_branch then
          -- Check if we're already on the correct branch
          local current_branch = vim.fn.systemlist("git branch --show-current")[1]

          if current_branch == session_branch then
            vim.notify("Already on branch: " .. session_branch)
            return
          end

          vim.notify("Switching from " .. current_branch .. " to " .. session_branch)
          local result = vim.fn.system("git checkout --quiet " .. vim.fn.shellescape(session_branch))

          if vim.v.shell_error ~= 0 then
            vim.notify(
              "Failed to checkout branch: " .. session_branch .. "\n" .. result,
              vim.log.levels.ERROR
            )
          else
            vim.cmd("checktime")
            vim.notify("Successfully switched to branch: " .. session_branch)
          end
        else
          vim.notify("No branch found in session filename")
        end
      end,
    })
  end,
}
