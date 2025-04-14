return {
	{
		"jay-babu/mason-nvim-dap.nvim",
		dependencies = { "mfussenegger/nvim-dap" },
		config = function()
			local mvd = require("mason-nvim-dap")
			mvd.setup({
				automatic_installation = true,
				ensure_installed = { "firefox", "js", "python" },
				handlers = {
					firefox = function()
						mvd.default_setup({
							adapters = {
								command = "firefox-debug-adapter",
								type = "executable",
							},
							name = "firefox",
						})
					end,
					js = function()
						mvd.default_setup({
							adapters = {
								executable = { command = "js-debug-adapter" },
								host = "localhost",
								port = "8124",
								type = "server",
							},
							name = "pwa-node",
						})
					end,
				},
			})
		end,
	},
	-- {
	-- 	"mxsdev/nvim-dap-vscode-js",
	-- 	dependencies = { "mfussenegger/nvim-dap" },
	-- 	config = function()
	-- 		-- setup adapters
	-- 		require("dap-vscode-js").setup({
	-- 			debugger_path = vim.fn.stdpath("data") .. "/mason/packages/js-debug-adapter",
	-- 			debugger_cmd = { "js-debug-adapter" },
	-- 			adapters = { "pwa-node", "firefox" },
	-- 			--"pwa-msedge", "node-terminal", "pwa-extensionHost"
	-- 		})
	-- 	end,
	-- },
	{
		"mxsdev/nvim-dap-vscode-js",
		dependencies = {
			"microsoft/vscode-js-debug",
			version = "1.x",
			build = "pnpm i && pnpm run compile vsDebugServerBundle && mv dist out",
		},
		config = function()
			local dap = require("dap")
			--local utils = require 'dap.utils'
			local dap_js = require("dap-vscode-js")
			--local mason = require 'mason-registry'

			---@diagnostic disable-next-line: missing-fields
			dap_js.setup({
				-- debugger_path = mason.get_package('js-debug-adapter'):get_install_path(),
				debugger_path = vim.fn.stdpath("data") .. "/lazy/vscode-js-debug",
				adapters = { "pwa-node", "firefox", "pwa-chrome", "pwa-msedge", "node-terminal", "pwa-extensionHost" },
			})

			local langs = { "javascript", "typescript", "svelte", "astro" }
			for _, lang in ipairs(langs) do
				dap.configurations[lang] = {
					{
						type = "pwa-node",
						request = "attach",
						name = "Attach debugger to existing `node --inspect` process",
						cwd = "${workspaceFolder}",
						skipFiles = {
							"${workspaceFolder}/node_modules/**/*.js",
							"${workspaceFolder}/packages/**/node_modules/**/*.js",
							"${workspaceFolder}/packages/**/**/node_modules/**/*.js",
							"<node_internals>/**",
							"node_modules/**",
						},
						sourceMaps = true,
						resolveSourceMapLocations = {
							"${workspaceFolder}/**",
							"!**/node_modules/**",
						},
					},
				}
			end
		end,
	},
	{
		"mfussenegger/nvim-dap",
		lazy = true,
		keys = {
			{
				desc = "Debug: Breakpoint Toggle",
				"<leader>bb",
				"<Cmd>DapToggleBreakpoint<CR>",
			},
			{
				desc = "Debug: Breakpoint Condition",
				"<leader>bB",
				function()
					vim.ui.input({ prompt = "Breakpoint condition: " }, function(condition)
						if not condition or condition == "" then
							return
						end

						require("dap").set_breakpoint(condition)
					end)
				end,
			},
			{
				desc = "Debug: Log Point",
				"<leader>bl",
				function()
					vim.ui.input({ prompt = "Log point message: " }, function(message)
						if not message or message == "" then
							return
						end

						require("dap").set_breakpoint(nil, nil, message)
					end)
				end,
			},
			{
				desc = "Debug: Continue",
				"<leader>bc",
				"<Cmd>DapContinue<CR>",
			},
			{
				desc = "Debug: New",
				"<leader>bn",
				"<Cmd>DapNew<CR>",
			},
			{
				desc = "Debug: Toggle REPL",
				"<leader>br",
				"<Cmd>DapToggleRepl<CR>",
			},
			{
				desc = "Debug: Hover",
				mode = { "n", "x" },
				"<leader>bh",
				function()
					require("dap.ui.widgets").hover(nil, { wrap = false })
				end,
			},
			{
				desc = "Debug: Frames",
				"<leader>bf",
				function()
					require("faergeek.utils.dap").frames_sidebar.toggle()
				end,
			},
			{
				desc = "Debug: Scopes",
				"<leader>bs",
				function()
					require("faergeek.utils.dap").scopes_sidebar.toggle()
				end,
			},
			{
				desc = "Debug: Step Over",
				"<leader>bo",
				"<Cmd>DapStepOver<CR>",
			},
			{
				desc = "Debug: Step Into",
				"<leader>bi",
				"<Cmd>DapStepInto<CR>",
			},
			{
				desc = "Debug: Step Out",
				"<leader>bO",
				"<Cmd>DapStepOut<CR>",
			},
			{
				desc = "Debug: List All Breakpoints",
				"<leader>ba",
				function()
					require("dap").list_breakpoints(true)
					vim.cmd.cwindow()
				end,
			},
			{
				desc = "Debug: Terminate",
				"<leader>bt",
				"<Cmd>DapTerminate<CR>",
			},
		},
		config = function()
			vim.fn.sign_define({
				{
					text = "",
					name = "DapBreakpoint",
					texthl = "DapUIBreakpointsLine",
				},
				{
					text = "",
					name = "DapBreakpointCondition",
					texthl = "DapUIBreakpointsLine",
				},
				{
					text = "",
					name = "DapLogPoint",
					texthl = "DapUIBreakpointsLine",
				},
				{
					text = "",
					name = "DapStopped",
					numhl = "DapUIBreakpointsCurrentLine",
					texthl = "DapUIBreakpointsCurrentLine",
				},
				{
					text = "",
					name = "DapBreakpointRejected",
					texthl = "DapUIBreakpointsDisabledLine",
				},
			})

			local dap = require("dap")
			-- TypeScript support
			dap.configurations.typescript = {
				{
					name = "Debug Jest File (TypeScript)",
					type = "pwa-node",
					request = "launch",
					runtimeExecutable = "npm",
					runtimeArgs = {
						"--inspect-brk",
						"../../node_modules/.bin/jest",
						"${file}",
						"--runInBand",
						"--coverage=false",
						"--no-cache",
					},
					cwd = "${workspaceFolder}",
					console = "integratedTerminal",
					internalConsoleOptions = "neverOpen",
				},
			}

			-- Optional: Setup dap-ui hooks
			local dapui = require("dapui")
			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated["dapui_config"] = function()
				dapui.close()
			end
			dap.listeners.before.event_exited["dapui_config"] = function()
				dapui.close()
			end
		end,
	},
	{
		"rcarriga/nvim-dap-ui",
		dependencies = {
			"nvim-neotest/nvim-nio",
			"mfussenegger/nvim-dap",
		},
		config = function()
			local dap, dapui = require("dap"), require("dapui")

			dapui.setup()

			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open()
			end
			dap.listeners.before.event_terminated["dapui_config"] = function()
				dapui.close()
			end
			dap.listeners.before.event_exited["dapui_config"] = function()
				dapui.close()
			end
		end,
		keys = {
			{ "<Leader>bu", ":lua require'dapui'.toggle()<CR>", desc = "Toggle DAP UI" },
		},
	},
	{
		"theHamsta/nvim-dap-virtual-text",
		dependencies = {
			"mfussenegger/nvim-dap",
		},
		config = function()
			require("nvim-dap-virtual-text").setup()
		end,
	},
}
