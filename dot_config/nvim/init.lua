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

vim.o.tabstop = 4 -- A TAB character looks like 4 spaces
--vim.o.expandtab = true -- Pressing the TAB key will insert spaces instead of a TAB character
vim.o.softtabstop = 4 -- Number of spaces inserted instead of a TAB character
vim.o.shiftwidth = 4 -- Number of spaces inserted when indenting
vim.o.termguicolors = true

--[[
vim.g.clipboard = {
	name = "osc52",
	copy = { ["+"] = { "wl-copy" }, ["*"] = { "wl-copy" } },
	paste = { ["+"] = { "wl-paste" }, ["*"] = { "wl-paste" } },
}
--]]
vim.o.clipboard = "unnamedplus"

--
local function map(mode, lhs, rhs, opts)
	local options = { noremap = true, silent = true }
	if opts then
		options = vim.tbl_extend("force", options, opts)
	end
	vim.api.nvim_set_keymap(mode, lhs, rhs, options)
end

vim.g.mapleader = " "
--vim.lsp.inlay_hint.enable()

--au BufNewFile,BufRead *zsh*.tmpl setfiletype zsh
--
vim.filetype.add({
	extension = {
		md = "markdown.md",
		mdx = "markdown.mdx",
	},
})
vim.filetype.add({
	pattern = {
		["%.env%.[%w_.-]+"] = "dotenv",
		["%.bashrc"] = "sh",
		["%.zshrc"] = "zsh",
		["dot_zshrc%.tmpl"] = "zsh",
		["dot_bashrc%.tmpl"] = "sh",
	},
})

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

require("lazy").setup("plugins")
