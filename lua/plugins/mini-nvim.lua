-- https://github.com/echasnovski/mini.icons
-- https://github.com/echasnovski/mini.pairs
-- https://github.com/echasnovski/mini.surround

return {
	{
		"nvim-mini/mini.icons",
		version = false,
		config = function()
			require("mini.icons").setup()
		end,
	},
	{
		"nvim-mini/mini.pairs",
		version = false,
		event = "VeryLazy",
		opts = {
			modes = { insert = true, command = true, terminal = false },
			-- skip autopair when next character is one of these
			skip_next = [=[[%w%%%'%[%"%.%`%$]]=],
			-- skip autopair when the cursor is inside these treesitter nodes
			skip_ts = { "string" },
			-- skip autopair when next character is closing pair
			-- and there are more closing pairs than opening pairs
			skip_unbalanced = true,
			-- better deal with markdown code blocks
			markdown = true,
		},
	},
	{
		"nvim-mini/mini.surround",
		keys = function(_, keys)
			-- Populate the keys based on the user's options
			local mappings = {
				{ "gsa", desc = "Add Surrounding", mode = { "n", "v" } },
				{ "gsd", desc = "Delete Surrounding" },
				{ "gsf", desc = "Find Right Surrounding" },
				{ "gsF", desc = "Find Left Surrounding" },
				{ "gsh", desc = "Highlight Surrounding" },
				{ "gsr", desc = "Replace Surrounding" },
				{ "gsn", desc = "Update `MiniSurround.config.n_lines`" },
			}
			mappings = vim.tbl_filter(function(m)
				return m[1] and #m[1] > 0
			end, mappings)
			return vim.list_extend(mappings, keys)
		end,
		opts = {
			mappings = {
				add = "gsa", -- Add surrounding in Normal and Visual modes
				delete = "gsd", -- Delete surrounding
				find = "gsf", -- Find surrounding (to the right)
				find_left = "gsF", -- Find surrounding (to the left)
				highlight = "gsh", -- Highlight surrounding
				replace = "gsr", -- Replace surrounding
				update_n_lines = "gsn", -- Update `n_lines`
			},
		},
	},
	{
		"nvim-mini/mini.move",
		version = false,
		config = function()
			-- Adding moves for insert mode
			vim.keymap.set("i", "<a-k>", "<c-o><cmd>m -2<cr><c-o>==", { desc = "Move a line up", silent = true })
			vim.keymap.set("i", "<a-j>", "<c-o><cmd>m +1<cr><c-o>==", { desc = "Move a line down", silent = true })

			require("mini.move").setup()
		end,
	},
}
