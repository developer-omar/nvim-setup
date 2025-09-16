-- https://github.com/mason-org/mason.nvim
-- https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim

return {
	{
		"mason-org/mason.nvim",
		opts = {
			ui = {
				icons = {
					package_installed = "✓",
					package_pending = "➜",
					package_uninstalled = "✗",
				},
			},
		},
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		dependencies = {
			"mason-org/mason.nvim",
		},
		opts = function(_, opts)
			-- LSP servers
			local lspServers = {
				"lua-language-server", -- lua_ls
				"vim-language-server",
				"html-lsp", -- html
				"css-lsp", -- cssls
				"css-variables-language-server",
				"tailwindcss-language-server",
				"emmet-language-server",
				"intelephense",
				"yaml-language-server",
				"marksman",
				"twiggy-language-server",
				"vue-language-server",
				"vtsls",
				"angular-language-server",
				"laravel-ls",
			}

			local formatters = {
				"stylua", -- Lua
				-- "php-cs-fixer", -- PHP
				"prettier", -- Web and Markdown
				"shfmt", -- Shell and Bash
				"isort", -- Python
				"black", -- Python
				"djlint", -- Django templates
				"blade-formatter", -- Blade templates
			}

			local ensure_installed = lspServers
			ensure_installed = vim.list_extend(ensure_installed, formatters)
			-- Installing with Mason
			opts.ensure_installed = ensure_installed

			return opts
		end,
	},
}
