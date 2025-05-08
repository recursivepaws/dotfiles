local utils = require("meovv.utils")
local lsp_utils = require("meovv.utils.lsp")
local map = utils.set_keymap

-- diagnostics
map("n", "<leader>x[", "<cmd>lua vim.diagnostic.goto_prev()<cr>", { desc = "Prev diagnostic" })
map("n", "<leader>x]", "<cmd>lua vim.diagnostic.goto_next()<cr>", { desc = "Next diagnostic" })
map(
	"n",
	"<leader>xl",
	'<cmd>lua vim.diagnostic.open_float(nil, { scope = "line", })<cr>',
	{ desc = "Current line diagnostic" }
)
map(
	"n",
	"<leader>xb",
	'<cmd>lua vim.diagnostic.open_float(nil, { scope = "buffer", })<cr>',
	{ desc = "Show buffer diagnostics" }
)

-- hover
map("n", "<leader>xd", "<cmd>lua vim.lsp.buf.hover()<cr>", { desc = "Show documentation" })

-- toggle inlay hints
map(
	"n",
	"<leader>lh",
	"<cmd>lua vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())<cr>",
	{ desc = "Toggle inlay hints for buffer" }
)

-- code actions
map("n", "<leader>gn", "<cmd>lua vim.lsp.buf.rename()<cr>", { desc = "Rename" })
map("n", "<leader>la", "<cmd>lua vim.lsp.buf.code_action()<cr>", { desc = "Code Actions" })
map("v", "<leader>la", "<cmd>lua vim.lsp.buf.range_code_actions()<cr>", { desc = "Range Code Actions" })

map("n", "<leader>lf", "", { desc = "Format", callback = lsp_utils.buf_format })
map("v", "<leader>lf", "<cmd>lua vim.lsp.buf.range_formatting()<cr>", { desc = "Range Format" })
-- lsp workspace
map("n", "<leader>lwa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<cr>", { desc = "Add workspace folder" })
map("n", "<leader>lwr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<cr>", {
	desc = "Remove workspace folder",
})
map(
	"n",
	"<leader>lwl",
	"<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<cr>",
	{ desc = "Show workspace folders" }
)
