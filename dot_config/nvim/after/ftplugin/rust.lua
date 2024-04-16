local bufnr = vim.api.nvim_get_current_buf()

-- Semicolon
vim.keymap.set("n", ";;", "$a;<Esc>", { buffer = bufnr })
-- Declaration
vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { buffer = bufnr })
-- Definition
vim.keymap.set("n", "<leader>d", vim.lsp.buf.definition, { buffer = bufnr })
-- Hover
vim.keymap.set("n", "<leader>k", vim.lsp.buf.hover, { buffer = bufnr })
-- Implementations
vim.keymap.set("n", "<leader>i", vim.lsp.buf.implementation, { buffer = bufnr })
-- Type definition
-- vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, { buffer = bufnr })
-- Rename
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { buffer = bufnr })
-- Code action
vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { buffer = bufnr })
-- References
vim.keymap.set("n", "<leader>r", vim.lsp.buf.references, { buffer = bufnr })
-- Format code
vim.keymap.set("n", "<leader>f", function()
	vim.lsp.buf.format({ async = true })
end, { buffer = bufnr })

vim.g.rustaceanvim = {
	server = {
		settings = {
			["rust-analyzer"] = {
				cargo = {
					--features = "all",
				},
			},
		},
	},
}

-- { "rust-analyzer.server.path": "~/.local/bin/rust-analyzer-linux" }

-- Custom tooling to update the Rust Analyzer target spontaneously
function UpdateRustAnalyzerTarget(newTarget)
	require("lspconfig").rust_analyzer.setup({
		settings = {
			["rust-analyzer"] = {
				cargo = {
					--features = "all",
					target = newTarget,
				},
			},
		},
	})

	-- Restart rust-analyzer
	vim.lsp.stop_client(vim.lsp.get_active_clients({ name = "rust-analyzer" }))
	vim.cmd([[edit]])
end
vim.cmd([[command! -nargs=1 SetTarget lua UpdateRustAnalyzerTarget(<f-args>)]])

-- Picker for choosing between targets
function RustTargetPicker()
	local targets = {
		"wasm32-unknown-unknown",
		"x86_64-unknown-linux-gnu",
	}

	require("telescope.pickers")
		.new({}, {
			prompt_title = "Rust Analyzer Target",
			finder = require("telescope.finders").new_table({
				results = targets,
			}),
			sorter = require("telescope.config").values.generic_sorter({}),
			attach_mappings = function(prompt_bufnr, map)
				local actions = require("telescope.actions")
				actions.select_default:replace(function()
					local selection = require("telescope.actions.state").get_selected_entry()
					actions.close(prompt_bufnr)
					UpdateRustAnalyzerTarget(selection.value)
				end)

				return true
			end,
		})
		:find()
end
vim.cmd([[command! PickTarget call v:lua.RustTargetPicker()]])
