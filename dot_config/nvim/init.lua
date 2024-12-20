local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

vim.o.tabstop = 4     -- A TAB character looks like 4 spaces
vim.o.softtabstop = 4 -- Number of spaces inserted instead of a TAB character
vim.o.shiftwidth = 4  -- Number of spaces inserted when indenting
vim.o.termguicolors = true
vim.o.clipboard = "unnamedplus"

-- Make sure we load the right spacing for web files
vim.api.nvim_create_autocmd({ "BufEnter", "BufWinEnter" }, {
	pattern = { "*.js", "*.jsx", "*.tsx", "*.ts" },
	callback = function()
		vim.opt_local.expandtab = true
		vim.opt_local.shiftwidth = 2
		vim.opt_local.tabstop = 2
	end
})

local function map(mode, lhs, rhs, opts)
	local options = { noremap = true, silent = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

vim.g.mapleader = " "
vim.lsp.inlay_hint.enable()

vim.filetype.add({
	pattern = {
		["%.env%.[%w_.-]+"] = "sh",
		["%.bashrc"] = "sh",
		["%.zshrc"] = "zsh",
		["dot_zshrc%.tmpl"] = "zsh",
		["dot_bashrc%.tmpl"] = "sh",
	},
})

-- Deno-specific markup
vim.g.markdown_fenced_languages = {
	"ts=typescript"
}

-- Disable arrow keys
map("", "<up>", "<nop>")
map("", "<down>", "<nop>")
map("", "<left>", "<nop>")
map("", "<right>", "<nop>")

-- Move around splits using Ctrl + {h,j,k,l}
map("n", "<C-h>", "<C-w>h")
map("n", "<C-j>", "<C-w>j")
map("n", "<C-k>", "<C-w>k")
map("n", "<C-l>", "<C-w>l")


require("navigation")
vim.keymap.set("n", ";;", "$a;<Esc>")
vim.keymap.set("n", "<leader>d", vim.lsp.buf.definition, { noremap = true })
vim.keymap.set("n", "<leader>D", definition_split, { noremap = true })
vim.keymap.set("n", "<leader>i", vim.lsp.buf.implementation, { noremap = true })
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { noremap = true })
vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { noremap = true })
vim.keymap.set("n", "<leader>r", vim.lsp.buf.references, { noremap = true })
vim.keymap.set("n", "<leader>f", format, { noremap = true })

require("lazy").setup("plugins")
