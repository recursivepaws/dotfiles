local user_config = require("meovv.core.user")
-- Improved file search
-- Added cmdline via telescope
return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		--"jonarrien/telescope-cmdline.nvim",
		"nvim-lua/popup.nvim",
		{
			"nvim-telescope/telescope-fzf-native.nvim",
			build = "make",
		},
	},
	config = function()
		require("meovv.plugins.telescope.config")
	end,
	init = function()
		-- normal mappings
		local u = require("meovv.utils")
		local t = require("meovv.plugins.telescope.utils")
		local map = u.set_keymap

		map("n", "<leader>fp", t.project_files, { desc = "Find project file" })
		map("n", "<leader>fg", t.project_grep, { desc = "Grep whole project" })
		map("n", "<leader>ff", ":Telescope find_files<cr>", { desc = "Find file" })
		map("n", "<leader>fb", ":Telescope git_branches<cr>", { desc = "Git branches" })
		map("n", "<leader>fs", ":Telescope live_grep<cr>", { desc = "Grep string" })
		map("n", "<leader>fk", ":Telescope buffers<cr>", { desc = "Find buffer" })
		map("n", "<leader>fw", ":Telescope grep_string<cr>", { desc = "Grep current word" })

		-- git navigation
		map("n", "<leader>vc", ":Telescope git_commits<cr>", { desc = "Git commits" })
		map("n", "<leader>vg", ":Telescope git_status<cr>", { desc = "Git status" })

		user_config.lsp.add_on_attach_mapping(function(client, bufnr)
			local buf_map = u.create_buf_map(bufnr)

			buf_map("n", "<leader>gd", "<cmd>Telescope lsp_definitions<cr>", { desc = "Go to definition" })
			buf_map("n", "<leader>gi", "<cmd>Telescope lsp_implementations<cr>", { desc = "Go to implementation" })
			buf_map("n", "<leader>gD", "<cmd>Telescope lsp_declaration<cr>", { desc = "Go to declaration" })
			buf_map("n", "<leader>gt", "<cmd>Telescope lsp_type_definitions<cr>", { desc = "Go to type definition" })
			buf_map("n", "<leader>gr", "<cmd>Telescope lsp_references<cr>", { desc = "Go to reference" })

			buf_map("n", "<leader>ldb", "<cmd>Telescope diagnostics bufnr=0<cr>", { desc = "Show buffer diagnostics" })
			buf_map("n", "<leader>ldw", "<cmd>Telescope diagnostics<cr>", { desc = "Workspace diagnostics" })
		end)
	end,
	lazy = false,
}
