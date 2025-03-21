local user_config = require("meovv.core.user")
local M = {}
local augroup_name = "MeovvNvimLspFormat"
M.augroup = vim.api.nvim_create_augroup(augroup_name, { clear = true })

M.format_on_save_enabled = true

function M.can_client_format_on_save(client)
	local user_server_config = user_config.lsp.servers[client.name]
	-- formatting enabled by default if server=true
	if user_server_config == true then
		return true
	end

	-- check config server settings
	if user_server_config then
		-- default to true if no format flag on server settings is set
		if user_server_config.format_on_save == nil then
			return true
		end
		-- check format flag on server settings
		return user_server_config.format_on_save == true
	end

	return true
end

function M.toggle_format_on_save()
	M.format_on_save_enabled = not M.format_on_save_enabled
	vim.notify(string.format("Format on save: %s", M.format_on_save_enabled))
end

function M.buf_format(bufnr, timeout)
	if timeout == "" or timeout == nil then
		timeout = user_config.lsp.format_timeout
	else
		timeout = timeout * 1000
	end
	vim.lsp.buf.format({
		timeout_ms = timeout,
		bufnr = bufnr or vim.api.nvim_get_current_buf(),
	})
end

function M.buf_get_active_clients_str()
	local active_clients = vim.lsp.get_clients({
		bufnr = vim.api.nvim_get_current_buf(),
	})
	local client_names = {}

	for _, client in pairs(active_clients or {}) do
		table.insert(client_names, client.name)
	end

	if not vim.tbl_isempty(client_names) then
		table.sort(client_names)
	end

	local client_str = ""

	if #client_names < 1 then
		return
	end

	for i, client_name in ipairs(client_names) do
		client_str = client_str .. client_name
		if i < #client_names then
			client_str = client_str .. ", "
		end
	end

	return client_str
end

function M.toggle_inlay_hints()
	local enabled = user_config.lsp.inlay_hint
	return function()
		enabled = not enabled
		vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({
			bufnr = vim.api.nvim_get_current_buf(),
		}))
	end
end

function M.configure_client_formatting(client, bufnr)
	-- set up :LspFormat for clients that are capable
	vim.cmd(string.format("command! -nargs=? LspFormat lua require('meovv.utils.lsp').buf_format(%s, <q-args>)", bufnr))

	-- set up auto format on save
	vim.api.nvim_clear_autocmds({
		group = M.augroup,
		buffer = bufnr,
	})
	vim.api.nvim_create_autocmd("BufWritePre", {
		callback = function()
			if M.format_on_save_enabled then
				vim.lsp.buf.format({
					timeout_ms = user_config.lsp.format_timeout,
					bufnr = bufnr,
					filter = function()
						return M.can_client_format_on_save(client)
					end,
				})
			end
		end,
		buffer = bufnr,
		group = M.augroup,
	})
end

--- Gets the root directories of all active clients for a target buffer or path
---@param target integer|string|nil # the target to get the roots for or 0 or nil for current
---@param sort boolean|nil # whether to sort the roots by length
---@return string[] # the root directories of the active clients
function M.lsp_roots(target, sort)
	local buffer, path = vim.fn.expand_target(target)

	local roots = {}
	if path then
		for _, client in ipairs(vim.lsp.get_clients({ bufnr = buffer })) do
			local workspace = client.config.workspace_folders

			---@type string[]
			local paths = workspace
					and vim.iter(workspace)
						:map(
							---@param ws lsp.WorkspaceFolder
							function(ws)
								return vim.uri_to_fname(ws.uri)
							end
						)
						:totable()
				or client.config.root_dir and { client.config.root_dir }
				or {}

			for _, p in ipairs(paths) do
				local r = vim.uv.fs_realpath(p)
				if r and path:find(r, 1, true) then
					if not vim.tbl_contains(roots, r) then
						roots[#roots + 1] = r
					end
				end
			end
		end
	end

	if sort then
		table.sort(roots, function(a, b)
			return #a > #b
		end)
	end

	return roots
end

--- Returns the project roots for a given target
---@param target vim.fn.Target # the target to get the roots for
---@return string[] # the list of roots
function M.roots(target)
	local buffer, path = vim.fn.expand_target(target)
	if not vim.api.nvim_buf_is_valid(buffer) then
		return {}
	end
	-- TODO: cache

	local roots = {}
	local function add(root)
		if not vim.tbl_contains(roots, root) then
			roots[#roots + 1] = root
		end
	end

	-- obtain all LSP roots
	for _, val in ipairs(M.lsp_roots(target)) do
		add(val)
	end

	-- find also roots based on patterns
	local cwd = assert(vim.uv.cwd())
	path = path and vim.fs.dirname(path) or cwd

	-- now add all the roots from the patterns
	local matched_files = vim.fs.find(M.root_patterns, {
		path = path,
		upward = true,
		limit = math.huge,
		stop = vim.uv.os_homedir(),
	})

	for _, matched_file in ipairs(matched_files) do
		add(vim.fs.dirname(matched_file))
	end

	-- add the cwd to the list for the last case scenario (only if no other roots were found)
	if #roots == 0 then
		add(cwd)
	end

	table.sort(roots, function(a, b)
		return #a > #b
	end)
	return roots
end

--- Returns the primary root for a given target
---@param target vim.fn.Target # the target to get the root for
---@param deepest boolean|nil # whether to return the deepest or the shallowest root (default is deepest)
---@return string # the root
function M.root(target, deepest)
	local roots = M.roots(target)
	assert(#roots > 0)

	if deepest == nil then
		deepest = true
	end

	if deepest then
		return roots[1]
	else
		return roots[#roots]
	end
end

--- Gets the path to a binary for a given target
---@param target vim.fn.Target # the target to get the binary path for
---@param bin string|nil # the path of the binary
function M.get_js_bin_path(target, bin)
	local sub = vim.fs.joinpath("node_modules", ".bin", bin)
	---@cast sub string

	return ide.fs.scan(M.roots(target), sub)
end

return M
