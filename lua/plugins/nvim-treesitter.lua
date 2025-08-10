return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = "VeryLazy",
    lazy = vim.fn.argc(-1) == 0, -- load treesitter early when opening a file from the cmdline
    keys = {
      { "<c-space>", desc = "Increment Selection" },
      { "<bs>", desc = "Decrement Selection", mode = "x" },
    },
    config = function ()
      require('nvim-treesitter.configs').setup({
        ensure_installed = {
          "lua",
          "html",
          "javascript",
          "json",
          "jsonc",
          "markdown",
          "php",
          "typescript",
          "vue",
          "yaml",
          "python",
          "twig",
          "dart",
          "angular",
          "sql",
          "vim",
          "vimdoc",
          "kdl",
          "toml",
          "tsx",
          "xml",
          "bash",
          "css",
          "scss",
          "htmldjango",
        },
        incremental_selection = {
          enable = true,
          keymaps = {
            init_selection = "<C-space>",
            node_incremental = "<C-space>",
            scope_incremental = false,
            node_decremental = "<bs>",
          },
        },
        sync_install = false,
        auto_install = true,
        ignore_install = { "" },
        indent = {
          enable = true,
          disable = { "yaml" }
        },
        highlight = {
          enable = true,
          disable = { "" },
          additional_vim_regex_highlighting = true,
        },
      })
    end
  },
  -- {
  --   "nvim-treesitter/nvim-treesitter-textobjects",
  --   dependencies = {
  --     "nvim-treesitter/nvim-treesitter"
  --   }
  -- }
}
