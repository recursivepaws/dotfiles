local user_config = require("meovv.core.user")
local utils = require("meovv.utils")
local lsp_utils = require("meovv.utils.lsp")
return {
	"CosmicNvim/cosmic-ui",
	dependencies = {
		"MunifTanjim/nui.nvim",
	},
	init = function()
		user_config.lsp.add_on_attach_mapping(function(client, bufnr)
			local buf_map = utils.create_buf_map(bufnr)
			buf_map("n", "<leader>gn", '<cmd>lua require("cosmic-ui").rename()<cr>', { desc = "Rename" })
			if vim.bo.filetype == "rust" then
				buf_map("n", "<leader>la", "<cmd>RustLsp codeAction<cr>", { desc = "Code Actions" })
				lsp_utils.configure_client_formatting(client, bufnr)
			else
				buf_map(
					"n",
					"<leader>la",
					'<cmd>lua require("cosmic-ui").code_actions()<cr>',
					{ desc = "Code Actions" }
				)
			end
			-- buf_map(
			-- 	"v",
			-- 	"<leader>la",
			-- 	'<cmd>lua require("cosmic-ui").range_code_actions()<cr>',
			-- 	{ desc = "Range Code Actions" }
			-- )
		end)
	end,
	config = function()
		require("cosmic-ui").setup({
			border_style = "rounded",
		})
	end,
	event = "VeryLazy",
}
