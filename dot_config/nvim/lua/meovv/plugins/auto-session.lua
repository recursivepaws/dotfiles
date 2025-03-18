vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"

return {
	"rmagatti/auto-session",
	lazy = false,
	keys = {
		{ "<leader>wr", "<cmd>SessionSearch<cr>", desc = "Session search" },
		{ "<leader>ws", "<cmd>SessionSave<cr>", desc = "Save session" },
		{ "<leader>wt", "<cmd>SessionToggleAutoSave<cr>", desc = "Toggle autosave" },
		{ "<leader>ww", ":w<cr>", desc = "Write buffer" },
		{ "<leader>wa", ":wall<cr>", desc = "Write all buffers" },
	},
	opts = {
		suppressed_dirs = { "~/", "~/Documents", "~/Downloads", "/" },
	},
}
