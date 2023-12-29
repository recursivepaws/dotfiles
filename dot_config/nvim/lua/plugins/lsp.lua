return {
  'neovim/nvim-lspconfig',
  dependencies = {
    'williamboman/mason.nvim',
    {
      'williamboman/mason-lspconfig.nvim',
      dependencies = {
        'williamboman/mason.nvim'
      },
    },
  },
  config = function()
    local lspconfig = require('lspconfig')
    require('mason').setup()
    require('mason-lspconfig').setup {
      ensure_installed = {
        'rust_analyzer',
        'lua_ls',
      },
    }
    local capabilities = require('cmp_nvim_lsp').default_capabilities()
    lspconfig.rust_analyzer.setup {
      capabilities = capabilities
    }

  end
}
