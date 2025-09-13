-- https://github.com/nvim-treesitter/nvim-treesitter
-- he goal of nvim-treesitter is both to provide a simple and easy way to use the interface for tree-sitter
-- in Neovim and to provide some basic functionality such as highlighting based on it

-- https://github.com/nvim-treesitter/nvim-treesitter-textobjects
-- https://github.com/nvim-treesitter/nvim-treesitter-context

return {
	-- Highlight, edit, and navigate code
	"nvim-treesitter/nvim-treesitter",
	build = ":TSUpdate",
	main = "nvim-treesitter.configs", -- Sets main module to use for opts
	-- [[ Configure Treesitter ]] See `:help nvim-treesitter`

	dependencies = {
		"nvim-treesitter/nvim-treesitter-textobjects",
	},
	keys = {
		{ "<c-space>", desc = "Increment Selection" },
		{ "<bs>", desc = "Decrement Selection", mode = "x" },
		{ "<leader>uI", "<cmd>InspectTree<cr>", desc = "Inspect Tree", mode = "n" },
	},
	opts = {
		ensure_installed = {
			"angular",
			"bash",
			"blade",
			"css",
			"dart",
			"dockerfile",
			"html",
			"htmldjango",
			"javascript",
			"json",
			"jsonc",
			"kdl",
			"lua",
			"luadoc",
			"markdown",
			"markdown_inline",
			"php",
			"python",
			"scss",
			"sql",
			"toml",
			"tsx",
			"twig",
			"typescript",
			"vim",
			"vimdoc",
			"vue",
			"xml",
			"yaml",
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

		-- Autoinstall languages that are not installed
		auto_install = true,
		highlight = {
			enable = true,
			-- Some languages depend on vim's regex highlighting system (such as Ruby) for indent rules.
			--  If you are experiencing weird indenting issues, add the language to
			--  the list of additional_vim_regex_highlighting and disabled languages for indent.
			additional_vim_regex_highlighting = true,
		},
		indent = {
			enable = true,
			disable = { "" },
			additional_vim_regex_highlighting = true,
		},

		-- textobjects
		textobjects = {
			select = {
				enable = true,
				lookahead = true,
				keymaps = {
					-- You can use the capture groups defined in textobjects.scm
					["af"] = { query = "@function.outer", desc = "around a function" },
					["if"] = { query = "@function.inner", desc = "inner part of a function" },
					["ac"] = { query = "@class.outer", desc = "around a class" },
					["ic"] = { query = "@class.inner", desc = "inner part of a class" },
					["ai"] = { query = "@conditional.outer", desc = "around an if statement" },
					["ii"] = { query = "@conditional.inner", desc = "inner part of an if statement" },
					["al"] = { query = "@loop.outer", desc = "around a loop" },
					["il"] = { query = "@loop.inner", desc = "inner part of a loop" },
					["ap"] = { query = "@parameter.outer", desc = "around parameter" },
					["ip"] = { query = "@parameter.inner", desc = "inside a parameter" },
				},
			},
		},
	},
	-- TODO: fix this part, cause conflict with selection <c-space>
	-- config = function()
	-- 	vim.filetype.add({
	-- 		pattern = {
	-- 			[".*Dockerfile.*"] = "dockerfile",
	-- 		},
	-- 	})
	-- end,

	-- config = function(_, opts)
	--   -- [[ Configure Treesitter ]] See `:help nvim-treesitter`
	--
	--   -- Prefer git instead of curl in order to improve connectivity in some environments
	--   require("nvim-treesitter.install").prefer_git = true
	--   ---@diagnostic disable-next-line: missing-fields
	--   require("nvim-treesitter.configs").setup(opts)
	--
	--   local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
	--   parser_config.blade = {
	--     install_info = {
	--       url = "https://github.com/EmranMR/tree-sitter-blade",
	--       files = { "src/parser.c" },
	--       branch = "main",
	--     },
	--     filetype = "blade",
	--   }
	--   vim.filetype.add({
	--     pattern = {
	--       [".*%.blade%.php"] = {
	--         function(path, bufnr, ext)
	--           local firstLine = vim.api.nvim_buf_get_lines(bufnr, 0, 1, false)[1] or ""
	--           if vim.startswith(firstLine, "<?php") then
	--             return "php"
	--           end
	--
	--           return "blade"
	--         end,
	--         { priority = math.huge, name = "blade" },
	--       },
	--     },
	--   })
	-- end,
}
