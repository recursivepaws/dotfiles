local M = {}

local augroup_name = "Meow.Lsp"
M.augroup = vim.api.nvim_create_augroup(augroup_name, { clear = true })

M.format_on_save_enabled = true

--- @param operation string
M.telescope = function(operation)
	return function()
		vim.cmd("Telescope " .. operation)
	end
end

M.toggle_format_on_save = function()
	M.format_on_save_enabled = not M.format_on_save_enabled
	vim.notify(string.format("Format on save: %s", M.format_on_save_enabled))
end

M.mason_bin = vim.fn.expand("$HOME/.local/share/nvim/mason/bin/")

M.prefer_system_binary = function(name)
	if vim.fn.executable(name) == 1 then
		vim.cmd([[lua print("using real bin")]])
		return name
	else
		vim.cmd([[lua print("fallback")]])
		return "kys"
	end
end

--- @param root_files string[] List of root-marker files to append to.
--- @param new_names string[] Potential root-marker filenames (e.g. `{ 'package.json', 'package.json5' }`) to inspect for the given `field`.
--- @param field string Field to search for in the given `new_names` files.
--- @param fname string Full path of the current buffer name to start searching upwards from.
function M.root_markers_with_field(root_files, new_names, field, fname)
	local path = vim.fn.fnamemodify(fname, ":h")
	local found = vim.fs.find(new_names, { path = path, upward = true })

	for _, f in ipairs(found or {}) do
		-- Match the given `field`.
		for line in io.lines(f) do
			if line:find(field) then
				root_files[#root_files + 1] = vim.fs.basename(f)
				break
			end
		end
	end

	return root_files
end

function M.insert_package_json(root_files, field, fname)
	return M.root_markers_with_field(root_files, { "package.json", "package.json5" }, field, fname)
end

return M
