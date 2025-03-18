local map = require("meovv.utils").set_keymap
--[[ return {
  "mfussenegger/nvim-dap",
  dependencies = {
    {
      "jay-babu/mason-nvim-dap.nvim",
      dependencies = {
        "williamboman/mason.nvim",
      },
      cmd = { "DapInstall", "DapUninstall" },
      opts = {
        ensure_installed = {
          "firefox",
          "js",
        },
        handlers = {
          firefox = function()
            require("mason-nvim-dap").default_setup({
              adapters = {
                command = "firefox-debug-adapter",
                type = "executable",
              },
              name = "firefox",
            })
          end,
          js = function()
            require("mason-nvim-dap").default_setup({
              adapters = {
                executable = { command = "js-debug-adapter" },
                host = "localhost",
                port = "8123",
                type = "server",
              },
              name = "pwa-node",
            })
          end,
        },
      },
    },
  },
  config = function()
    require("mason-nvim-dap").setup({
      automatic_installation = true,
      ensure_installed = { "python", "" },
    })
  end,
} ]]
return {
  {
    "mfussenegger/nvim-dap",
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
    dependencies = {
      {
        "jay-babu/mason-nvim-dap.nvim",
        dependencies = {
          "williamboman/mason.nvim",
        },
        cmd = { "DapInstall", "DapUninstall" },
        opts = {
          ensure_installed = {
            "firefox",
            "js",
          },
          handlers = {
            firefox = function()
              require("mason-nvim-dap").default_setup({
                adapters = {
                  command = "firefox-debug-adapter",
                  type = "executable",
                },
                name = "firefox",
              })
            end,
            js = function()
              require("mason-nvim-dap").default_setup({
                adapters = {
                  executable = { command = "js-debug-adapter" },
                  host = "localhost",
                  port = "8123",
                  type = "server",
                },
                name = "pwa-node",
              })
            end,
          },
        },
      },
    },
    config = function()
      -- require("dap").providers.configs["custom-neoconf"] = function()
      --   return require("neoconf").get("debuggers")
      -- end

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
    end,
  },
  {
    "rcarriga/nvim-dap-ui",
    dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
    config = function()
      map("n", "<leader>bu", require("dapui").toggle, { desc = "DAP: Dapui toggle" })
    end,
  },
}
