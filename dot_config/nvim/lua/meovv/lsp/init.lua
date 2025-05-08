-- Real programming languages
require("meovv.lsp.luals")()
require("meovv.lsp.pyright")()

-- Mental disorders
require("meovv.lsp.eslint")()
require("meovv.lsp.html")()
require("meovv.lsp.prettier")()
require("meovv.lsp.tsls")()
require("meovv.lsp.jsonls")()

vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())

require("meovv.lsp.diagnostics")
require("meovv.lsp.mappings")
