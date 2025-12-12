-- vim.lsp.set_log_level("TRACE")

-- Real programming languages
require("meovv.lsp.luals")
require("meovv.lsp.pyright")
require("meovv.lsp.sqls")
require("meovv.lsp.wgsl")
require("meovv.lsp.bashls")
require("meovv.lsp.awkls")
require("meovv.lsp.dockerls")
require("meovv.lsp.tombi")
require("meovv.lsp.nil")
require("meovv.lsp.tinymist")
require("meovv.lsp.zls")

-- XXX: Terminal mental disorders
-- require("meovv.lsp.eslint")
-- require("meovv.lsp.tsls")

-- INFO: Treatable mental disorders
require("meovv.lsp.html")
-- require("meovv.lsp.tsgo")
require("meovv.lsp.vtsls")
require("meovv.lsp.biome")

-- require("meovv.lsp.jsonls")

-- Worthy of rehabilitation
require("meovv.lsp.yaml")
require("meovv.lsp.gh-actions")

-- Normal things
require("meovv.lsp.diagnostics")
require("meovv.lsp.mappings")

vim.lsp.config("rust-analyzer", {})

-- Auto attach mappings
require("meovv.lsp.attach")
