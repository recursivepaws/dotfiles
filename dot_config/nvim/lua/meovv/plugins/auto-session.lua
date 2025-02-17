local map = require("meovv.utils").set_keymap
return {
	"rmagatti/auto-session",
	lazy = false,
	config = function()
		require("auto-session").setup({
			pre_save_cmds = { "cclose", "lua vim.notify.dismiss()" },
			auto_session_enabled = true,
			auto_restore_enabled = true,
			auto_save_enabled = true,
		})
	end,
	init = function()
		vim.o.sessionoptions = "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal,localoptions"
		map("n", "<leader>sl", "<cmd>silent RestoreSession<cr>", { desc = "Restore session" })
		map("n", "<leader>ss", "<cmd>SaveSession<cr>", { desc = "Save session" })
		map(
			"n",
			"<leader>si",
			'<cmd>lua require("meovv.utils.logger"):log("Session name: " .. require("auto-session-library").current_session_name())<cr>',
			{ desc = "Print session" }
		)
	end,
}
