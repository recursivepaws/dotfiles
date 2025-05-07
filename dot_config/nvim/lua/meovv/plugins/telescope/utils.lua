local M = {}

M.project_files = function()
	local opts = {} -- define here if you want to define something
	local ok = pcall(require("telescope.builtin").git_files, opts)
	if not ok then
		require("telescope.builtin").find_files(opts)
	end
end

M.project_grep = function()
	local builtin = require("telescope.builtin")
	local opts = {}

	local ok = pcall(builtin.git_files, opts)
	if ok then
		local root = vim.fn.systemlist("git rev-parse --show-toplevel")[1]
		builtin.live_grep(vim.tbl_extend("force", opts, { cwd = root }))
	else
		builtin.live_grep(opts)
	end
end

return M
