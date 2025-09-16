-- https://github.com/stevearc/conform.nvim
-- Lightweight yet powerful formatter plugin for Neovim

return {
	"stevearc/conform.nvim",
	init = function()
		vim.o.formatexpr = "v:lua.require('conform').formatexpr()"
	end,
	opts = function()
		local conform = require("conform")

		local function is_phpcsfixer_available(bufnr)
			return conform.get_formatter_info("phpcsfixer", bufnr).available
		end

		return {
			default_format_opts = {
				lsp_format = "fallback",
			},

			format_on_save = function(bufnr)
				local ft = vim.bo[bufnr].filetype
				if ft == "php" then
					if is_phpcsfixer_available(bufnr) then
						return { lsp_fallback = false, timeout_ms = 500 }
					else
						return false -- Skip formatting entirely
					end
				end
				return { lsp_fallback = true, timeout_ms = 500 }
			end,

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

				php = { "phpcsfixer" },

				sh = { "shfmt" },
				bash = { "shfmt" },
				blade = { "blade-formatter" },
			},

			formatters = {
				phpcsfixer = {
					command = vim.fn.stdpath("config") .. "/scripts/docker-php-cs-fixer.sh",
					args = { "$FILENAME" },
					stdin = false,
				},
			},
		}
	end,

	config = function(_, opts)
		local conform = require("conform")
		conform.setup(opts)

		vim.keymap.set({ "n", "v" }, "<leader>cf", function()
			conform.format({
				async = true,
			})
		end, { desc = "Format Code or Range" })
	end,
}

-- return {
--   "stevearc/conform.nvim",
--   init = function()
--     vim.o.formatexpr = "v:lua.require('conform').formatexpr()"
--   end,
--   -- keys = {
--   -- 	{
--   -- 		"<leader>cf",
--   -- 		function()
--   -- 			require("conform").format({ async = true, lsp_format = "fallback" }, function(err, did_edit)
--   -- 				if not err and did_edit then
--   -- 					vim.notify("Code formatted", vim.log.levels.INFO, { title = "Conform" })
--   -- 				end
--   -- 			end)
--   -- 		end,
--   -- 		mode = { "n", "v" },
--   -- 		desc = "Format Code or Range",
--   -- 	},
--   -- },
--   opts = {
--     format_on_save = function(bufnr)
--       local ft = vim.bo[bufnr].filetype
--       if ft == "php" then
--         return { lsp_fallback = false, timeout_ms = 500 }
--       end
--       return { lsp_fallback = true, timeout_ms = 500 }
--     end,
--     formatters_by_ft = {
--       lua = { "stylua" },
--
--       javascript = { "prettier" },
--       typescript = { "prettier" },
--       javascriptreact = { "prettier" },
--       typescriptreact = { "prettier" },
--       json = { "prettier" },
--       jsonc = { "prettier" },
--       yaml = { "prettier" },
--       markdown = { "prettier" },
--       html = { "prettier" },
--       css = { "prettier" },
--       scss = { "prettier" },
--
--       python = { "isort", "black" },
--
--       php = { "phpcsfixer" },
--
--       sh = { "shfmt" },
--       bash = { "shfmt" },
--       blade = { "blade-formatter" },
--     },
--     -- default_format_opts = {
--     -- 	lsp_format = "fallback",
--     -- },
--     formatters = {
--       phpcsfixer = {
--         command = vim.fn.stdpath("config") .. "/scripts/docker-php-cs-fixer.sh",
--         args = { "$FILENAME" },
--         stdin = false,
--       },
--     },
--   },
-- }
