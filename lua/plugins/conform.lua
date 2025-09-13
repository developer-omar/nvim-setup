-- https://github.com/stevearc/conform.nvim
-- Lightweight yet powerful formatter plugin for Neovim

return {
	"stevearc/conform.nvim",
	keys = {
		{
			"<leader>cf",
			function()
				require("conform").format({ async = true, lsp_format = "fallback" }, function(err, did_edit)
					if not err and did_edit then
						vim.notify("Code formatted", vim.log.levels.INFO, { title = "Conform" })
					end
				end)
			end,
			mode = { "n", "v" },
			desc = "Format Code or Range",
		},
	},
	opts = {
		formatters_by_ft = {
			lua = { "stylua" },

			javascript = { "prettier" },
			typescript = { "prettier" },
			javascriptreact = { "prettier" },
			typescriptreact = { "prettier" },
			json = { "prettier" },
			jsonc = { "prettier" },
			yaml = { "prettier" },
			markdown = { "prettier" },
			html = { "prettier" },
			css = { "prettier" },
			scss = { "prettier" },

			python = { "isort", "black" },

			-- php = { "php_cs_fixer" },
			php = { "php-cs-fixer" },

			sh = { "shfmt" },
			bash = { "shfmt" },
			blade = { "blade-formatter" },
		},
		default_format_opts = {
			lsp_format = "fallback",
			-- lsp_format = "never",
		},
		-- formatters = {
		-- php_cs_fixer = {
		-- 	command = "docker compose",
		-- 	-- command = vim.fn.expand("../../scripts/docker-php-cs-fixer.sh"),
		-- 	-- TODO: Arreglar esta parte para formatear codigo php
		-- 	args = function(ctx)
		-- 		return {
		-- 			"run",
		-- 			"--rm",
		-- 			"php-cs-fixer",
		-- 			"fix",
		-- 			"/app/" .. vim.fn.fnamemodify(ctx.filename, ":t"),
		-- 			"--config=.php-cs-fixer.php",
		-- 			"--quiet",
		-- 		}
		-- 	end,
		-- },
		-- },
	},
	init = function()
		vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"
	end,
}
