local bufnr = vim.api.nvim_get_current_buf()

-- Declaration
vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { buffer = bufnr })
-- Definition
vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = bufnr })
-- Hover
vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = bufnr })
-- Implementations
vim.keymap.set("n", "gi", vim.lsp.buf.implementation, { buffer = bufnr })
-- Type definition
vim.keymap.set("n", "<space>D", vim.lsp.buf.type_definition, { buffer = bufnr })
-- Rename
vim.keymap.set("n", "<space>rn", vim.lsp.buf.rename, { buffer = bufnr })
-- Code action
vim.keymap.set({ "n", "v" }, "<space>ca", vim.lsp.buf.code_action, { buffer = bufnr })
-- References
vim.keymap.set("n", "gr", vim.lsp.buf.code_action, { buffer = bufnr })
-- Format code
vim.keymap.set("n", "<space>f", function()
	vim.lsp.buf.format({ async = true })
end, { buffer = bufnr })
