local mason_bin = require("meovv.utils.lsp").mason_bin

vim.lsp.config("wgsl", {
  cmd = { mason_bin .. "wgsl_analyzer", "--stdio" },
  filetypes = { "wgsl", "vert", "frag" },
  init_options = {
    provideFormatter = true,
  },
  settings = {},
  workspace_required = false,
})

vim.lsp.enable("wgsl")
