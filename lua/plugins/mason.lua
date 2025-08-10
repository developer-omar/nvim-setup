return {
  {
    "williamboman/mason.nvim",
    opts = {
      ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
      }
    }
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = {
      "neovim/nvim-lspconfig",
    },
    config = function ()
      local lspServers = require("config.lsp-servers")
      require("mason-lspconfig").setup({
        ensure_installed = vim.tbl_keys(lspServers)
      })
    end

  },
  -- {
  --   "WhoIsSethDaniel/mason-tool-installer.nvim",
  --   config = function() 
  --     local lspServers = require("config.lsp-servers")
  --     require('mason-tool-installer').setup { ensure_installed = lspServers }
  --   end,
  -- }

}
