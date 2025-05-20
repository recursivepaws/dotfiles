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

--[[ M.buf_format = function(bufnr, timeout)
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

M.buf_get_active_clients_str = function()
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

M.toggle_inlay_hints = function()
	local enabled = user_config.lsp.inlay_hint
	return function()
		enabled = not enabled
		vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({
			bufnr = vim.api.nvim_get_current_buf(),
		}))
	end
end

M.configure_client_formatting = function(client, bufnr)
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
end ]]

M.mason_bin = vim.fn.expand("$HOME/.local/share/nvim/mason/bin/")

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
