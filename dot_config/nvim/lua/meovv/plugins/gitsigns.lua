local u = require("meovv.utils")

return {
  "lewis6991/gitsigns.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  event = "VeryLazy",
  cmd = "Gs",
  opts = {
    preview_config = {
      -- Options passed to nvim_open_win
      -- border = user_config.border,
      style = "minimal",
      relative = "cursor",
      row = 0,
      col = 1,
    },
    on_attach = function(bufnr)
      local gs = require("gitsigns")
      local map = u.buf_map(bufnr)
      -- Navigation
      map("n", "]c", function()
        if vim.wo.diff then
          return "]c"
        end
        vim.schedule(function()
          gs.next_hunk()
        end)
        return "<Ignore>"
      end, {
        expr = true,
        desc = "Next git hunk",
      })

      map("n", "[c", function()
        if vim.wo.diff then
          return "[c"
        end
        vim.schedule(function()
          gs.prev_hunk()
        end)
        return "<Ignore>"
      end, {
        expr = true,
        desc = "Prev git hunk",
      })

      -- Actions
      map("n", "<leader>vs", gs.stage_hunk, { desc = "Stage hunk" })
      map("n", "<leader>vr", gs.reset_hunk, { desc = "Reset hunk" })
      map("n", "<leader>vS", gs.stage_buffer, { desc = "Stage buffer" })
      map("n", "<leader>vu", gs.undo_stage_hunk, { desc = "Undo stage hunk" })
      map("n", "<leader>vR", gs.reset_buffer, { desc = "Reset buffer" })
      map("n", "<leader>vp", gs.preview_hunk, { desc = "Preview hunk" })
      map("n", "<leader>vB", function()
        gs.blame_line({ full = true })
      end, {
        desc = "Blame line",
      })
      map("n", "<leader>vd", gs.diffthis, { desc = "Diff buffer" })
      map("n", "<leader>vD", function()
        gs.diffthis("~")
      end, { desc = "Diff project" })
      -- map("n", "<leader>td", gs.toggle_deleted, { desc = "Toggle delete" })

      --[[ -- Text object ]]
      map({ "o", "x" }, "ih", ":<C-U>Gitsigns select_hunk<CR>", { desc = "Select hunk" })
    end,
  },
}
