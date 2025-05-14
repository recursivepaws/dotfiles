local map = require("meovv.utils").map

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
