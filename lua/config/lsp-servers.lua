return {
  lua_ls = {
    -- cmd = { ... },
    -- filetypes = { ... },
    -- capabilities = {},
    settings = {
      Lua = {
        completion = {
          callSnippet = 'Replace',
        },
        -- You can toggle below to ignore Lua_LS's noisy `missing-fields` warnings
        -- diagnostics = { disable = { 'missing-fields' } },
      },
    },
  },
  emmet_language_server = {
    filetypes = {
      "css",
      "eruby",
      "html",
      "javascript",
      "javascriptreact",
      "less",
      "sass",
      "scss",
      "pug",
      "typescriptreact",
      "htmldjango",
      "htmlangular",
      "vue-html",
      "vue",
      "twig",
    },
  },
  volar = { "vue" },
  -- ts_ls = {
  --   init_options = {
  --     plugins = {
  --       {
  --         name = "@vue/typescript-plugin",
  --         location = "~/.nvm/versions/node/v20.17.0/lib/node_modules/@vue/typescript-plugin",
  --         languages = {"javascript", "typescript", "vue"}
  --       }
  --     }
  --   },
  --   filetypes = {
  --     "javascript",
  --     "javascriptreact",
  --     "javascript.jsx",
  --     "typescript",
  --     "typescriptreact",
  --     "typescript.tsx",
  --     "vue"
  --   }
  -- },
  marksman = {},
  intelephense = {},
  html = {},
  cssls = {
    filetypes = {
      "css",
      "scss",
      "sass",
      "less"
    }
  },
  yamlls = {},
  sqlls = {},
  twiggy_language_server = {},
}
