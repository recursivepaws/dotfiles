local buf_map = require("meovv.utils").buf_map
local augroup = require("meovv.utils.lsp").augroup

vim.api.nvim_create_autocmd("LspAttach", {
  group = augroup,
  callback = function(args)
    local map = buf_map(args.buf)
    local client = assert(vim.lsp.get_client_by_id(args.data.client_id))

    --- @param method vim.lsp.protocol.Method.ClientToServer
    local supports = function(method)
      return client:supports_method(method)
    end

    -- vim.no
    vim.notify(client.name .. " was attached...")
    -- vim

    -- L prefix (perform LSP action)
    map("n", "<leader>lwa", vim.lsp.buf.add_workspace_folder, { desc = "Add workspace folder" })
    map("n", "<leader>lwr", vim.lsp.buf.remove_workspace_folder, { desc = "Remove workspace folder" })
    map("n", "<leader>lwl", function()
      vim.notify(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, { desc = "Show workspace folders" })

    if supports("textDocument/codeAction") then
      map("n", "<leader>la", vim.lsp.buf.code_action, { desc = "Code Actions" })
    end
    if supports("textDocument/formatting") then
      map("n", "<leader>lf", vim.lsp.buf.format, { desc = "Format" })
    end
    if supports("textDocument/rangeFormatting") then
      map("v", "<leader>lf", vim.lsp.buf.format, { desc = "Range Format" })
    end
    if supports("textDocument/rename") then
      map("n", "<leader>lr", vim.lsp.buf.rename, { desc = "Rename" })
    end

    if supports("textDocument/inlayHint") then
      map("n", "<leader>lh", function()
        vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
      end, { desc = "Toggle inlay hints" })
    end

    -- G prefix (goto)
    local telescope = require("meovv.utils.lsp").telescope
    if supports("textDocument/implementation") then
      map("n", "<leader>gi", telescope("lsp_implementations"), { desc = "Go to implementation" })
    end

    if supports("textDocument/definition") then
      map("n", "<leader>gd", telescope("lsp_definitions"), { desc = "Go to declaration" })
    end
    if supports("textDocument/typeDefinition") then
      map("n", "<leader>gt", telescope("lsp_type_definitions"), { desc = "Go to type" })
    end
    if supports("textDocument/references") then
      map("n", "<leader>gr", telescope("lsp_references"), { desc = "Go to references" })
    end

    -- F prefix (find)
    -- if supports("textDocument/diagnostic") or supports("workspace/diagnostic") then
    if vim.diagnostic.is_enabled() then
      map("n", "<leader>fd", telescope("diagnostics"), { desc = "Workspace diagnostics" })
    end
    -- end

    -- Toggle inlay hints

    -- Enable auto-completion. Note: Use CTRL-Y to select an item. |complete_CTRL-Y|
    -- if supports("textDocument/completion") then
    -- vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
    -- end

    if client.name == "eslint" then
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = args.buf,
        callback = function()
          if vim.fn.exists(":LspEslintFixAll") > 0 then
            vim.cmd("LspEslintFixAll")
          end
        end,
      })
    else
      if not supports("textDocument/willSaveWaitUntil") and supports("textDocument/formatting") then
        vim.api.nvim_create_autocmd("BufWritePre", {
          group = augroup,
          buffer = args.buf,
          callback = function()
            vim.lsp.buf.format({ bufnr = args.buf, id = client.id, timeout_ms = 1000 })
          end,
        })
      end
    end

    -- Rustaceanvim has some custom options that we need to overwrite
    if client.name == "rust-analyzer" then
      map("n", "K", function()
        vim.cmd.RustLsp({ "hover", "actions" })
      end, { desc = "Hover" })
      map("n", "<leader>la", function()
        vim.cmd.RustLsp("codeAction")
      end, { desc = "Code Actions" })
      map("n", "<leader>lf", vim.cmd.RustFmt, { desc = "Format" })
      map("v", "<leader>lf", vim.cmd.RustFmtRange, { desc = "Format" })
    end
  end,
})
