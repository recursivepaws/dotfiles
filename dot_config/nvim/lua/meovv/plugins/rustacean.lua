return {
	"mrcjkb/rustaceanvim",
	version = "^6",
	ft = { "rust" },
	dependencies = { "mfussenegger/nvim-dap" },
	init = function()
		vim.g.rustaceanvim = {
			tools = {},
			server = {
				-- on_attach = function(client, bufnr)
				-- 	map(client, bufnr)
				-- 	set_inlay_hint(client, bufnr)
				-- end,
				settings = {
					["rust-analyzer"] = {},
				},
			},
			dap = {},
		}
	end,
}
