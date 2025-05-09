return {
	"mistricky/codesnap.nvim",
	build = "make build_generator",
	keys = {
		{ "<leader>cc", "<cmd>CodeSnap<cr>", mode = "x", desc = "Save selected code snapshot into clipboard" },
		{ "<leader>cs", "<cmd>CodeSnapSave<cr>", mode = "x", desc = "Save selected code snapshot in ~/Pictures/Code" },
		{
			"<leader>ca",
			"<cmd>CodeSnapSave<cr>",
			mode = "x",
			desc = "Save selected code snapshot as ASCII into clipboard",
		},
	},
	config = function()
		require("codesnap").setup({
			save_path = "~/Pictures/Code",
			code_font_family = "CaskaydiaCove Nerd Font",
			bg_x_padding = 33,
			bg_y_padding = 33,
			mac_window_bar = false,
			has_breadcrumbs = true,
			show_workspace = true,
			bg_theme = "summer",
		})
	end,
}
