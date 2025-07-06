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
          ["rust-analyzer"] = {
            cargo = {
              -- target = ["wasm32-unknown-unknown"],
              -- features = "all"
            },
          },
        },
      },
      dap = {},
    }
    vim.api.nvim_create_autocmd("BufWritePost", {
      pattern = "*.rs",
      callback = function()
        local cwd = vim.fn.getcwd()
        if vim.fn.filereadable(cwd .. "/Dioxus.toml") == 1 then
          local command = "dx fmt"
          vim.cmd("silent ! " .. command)
          -- vim.notify("dx fmt")
        end
      end,
    })
  end,
}
