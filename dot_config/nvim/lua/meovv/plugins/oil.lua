-- Best way to navigate and modify filesystem
return {
	"stevearc/oil.nvim",
	opts = {},
	dependencies = { "nvim-tree/nvim-web-devicons" },
	-- dependencies = { { "echasnovski/mini.icons", opts = {} } },
	-- config = function()
	-- end,
	init = function()
		require("oil").setup()
		local u = require("meovv.utils")
		local map = u.set_keymap
		map("n", "-", "<CMD>Oil<CR>", { desc = "Grep string" })
	end,
}
