if vim.fn.has("nvim-0.11") == 0 then
	error("Need Neovim v0.11+ (Nightly) in order to run Cosmic!")
end

local ok, err = pcall(require, "meovv")

if not ok then
	error(("Error loading core...\n\n%s"):format(err))
end

-- vim.o.tabstop = 4 -- A TAB character looks like 4 spaces
-- vim.o.softtabstop = 4 -- Number of spaces inserted instead of a TAB character
-- vim.o.shiftwidth = 4 -- Number of spaces inserted when indenting

vim.filetype.add({
	pattern = {
		["%.env%.[%w_.-]+"] = "sh",
		["%.bashrc"] = "sh",
		["%.zshrc"] = "zsh",
		["dot_zshrc%.tmpl"] = "zsh",
		["dot_bashrc%.tmpl"] = "sh",
	},
})
--[[
-- Deno-specific markup
vim.g.markdown_fenced_languages = {
	"ts=typescript",
} ]]

--[[
require("navigation")
vim.keymap.set("n", ";;", "$a;<Esc>")
vim.keymap.set("n", "<leader>d", vim.lsp.buf.definition, { noremap = true })
vim.keymap.set("n", "<leader>D", definition_split, { noremap = true })
vim.keymap.set("n", "<leader>i", vim.lsp.buf.implementation, { noremap = true })
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { noremap = true })
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { noremap = true })
vim.keymap.set("n", "<leader>r", vim.lsp.buf.references, { noremap = true })
vim.keymap.set("n", "<leader>f", format, { noremap = true })

require("lazy").setup("plugins") ]]
