local icons = require("meovv.utils.icons")
local M = {}

M.git_root = function()
  return vim.fn.systemlist("git rev-parse --show-toplevel 2> /dev/null")[1]
end

M.project_files = function()
  local opts = {} -- define here if you want to define something
  local ok = pcall(require("telescope.builtin").git_files, opts)
  if not ok then
    require("telescope.builtin").find_files({})
  end
end

M.project_grep = function()
  local builtin = require("telescope.builtin")
  local root = M.git_root()
  if root then
    builtin.live_grep({
      prompt_title = icons.git.hub .. " Grep Git Project " .. icons.git.hub,
      cwd = root,
    })
  else
    vim.notify("Not in a git direcotry")
  end
end

return M
