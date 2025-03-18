local utils = require("meovv.utils")
local lsp_utils = require("meovv.utils.lsp")
local M = {}

-- Mappings.
function M.init(client, bufnr)
	local buf_map = utils.create_buf_map(bufnr, {
		noremap = false,
	})

	-- diagnostics
	buf_map("n", "<leader>x[", "<cmd>lua vim.diagnostic.goto_prev()<cr>", { desc = "Prev diagnostic" })
	buf_map("n", "<leader>x]", "<cmd>lua vim.diagnostic.goto_next()<cr>", { desc = "Next diagnostic" })
	buf_map(
		"n",
		"<leader>xl",
		'<cmd>lua vim.diagnostic.open_float(nil, { scope = "line", })<cr>',
		{ desc = "Current line diagnostic" }
	)
	buf_map(
		"n",
		"<leader>xb",
		'<cmd>lua vim.diagnostic.open_float(nil, { scope = "buffer", })<cr>',
		{ desc = "Show buffer diagnostics" }
	)

	-- hover
	buf_map("n", "<leader>xd", "<cmd>lua vim.lsp.buf.hover()<cr>", { desc = "Show documentation" })

	-- inlay hints
	if client.supports_method("textDocument/inlayHint") then
		buf_map("n", "<leader>lh", lsp_utils.toggle_inlay_hints(), { desc = "Toggle inlay hints for buffer" })
	end

	-- code actions
	buf_map("n", "<leader>gn", "<cmd>lua vim.lsp.buf.rename()<cr>", { desc = "Rename" })
	buf_map("n", "<leader>la", "<cmd>lua vim.lsp.buf.code_actions()<cr>", { desc = "Code Actions" })
	buf_map("v", "<leader>la", "<cmd>lua vim.lsp.buf.range_code_actions()<cr>", { desc = "Range Code Actions" })

	-- formatting
	if client.supports_method("textDocument/formatting") then
		buf_map("n", "<leader>lf", "", { desc = "Format", callback = lsp_utils.buf_format })
		buf_map("v", "<leader>lf", "<cmd>lua vim.lsp.buf.range_formatting()<cr>", { desc = "Range Format" })
	end

	-- lsp workspace
	buf_map("n", "<leader>lwa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<cr>", { desc = "Add workspace folder" })
	buf_map("n", "<leader>lwr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<cr>", {
		desc = "Remove workspace folder",
	})
	buf_map(
		"n",
		"<leader>lwl",
		"<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<cr>",
		{ desc = "Show workspace folders" }
	)
end

return M
