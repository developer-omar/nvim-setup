-- https://github.com/akinsho/bufferline.nvim
-- buffer line (with tabpage integration) for Neovim built using lua
-- :h bufferline.nvim

return {
	"akinsho/bufferline.nvim",
	version = "*",
	event = "VeryLazy",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
	keys = {
		{ "<leader>bb", "<cmd>BufferLinePick<cr>", desc = "Pick a Buffer" },
		{ "<S-h>", "<cmd>BufferLineCyclePrev<cr>", desc = "Prev Buffer" },
		{ "<S-l>", "<cmd>BufferLineCycleNext<cr>", desc = "Next Buffer" },
		{ "<M-S-h>", "<cmd>BufferLineMovePrev<cr>", desc = "Move Buffer Prev" },
		{ "<M-S-l>", "<cmd>BufferLineMoveNext<cr>", desc = "Move Buffer Next" },
		{ "<leader>br", "<cmd>BufferLineCloseRight<cr>", desc = "Delete Buffers to the Right" },
		{ "<leader>bl", "<cmd>BufferLineCloseLeft<cr>", desc = "Delete Buffers to the Left" },
	},
	opts = {
		options = {
			always_show_bufferline = false,
			diagnostics = "nvim_lsp",
			--- count is an integer representing total count of errors
			--- level is a string "error" | "warning"
			--- diagnostics_dict is a dictionary from error lvl ("error", "warning" or "info")to number of errors for each level.
			--- this should return a string
			--- Don't get too fancy as this function will be executed a lot
			diagnostics_indicator = function(count, level, diagnostics_dict, context)
				local icon = level:match("error") and " " or " "
				return " " .. icon .. count
			end,
			indicator = {
				-- posible values icon | underline | none
				style = "icon",
			},
			-- numbers = "ordinal",
			-- posible values slant | slope | thick | thin
			-- separator_style = "slope",
			hover = {
				enabled = true,
				delay = 200,
				reveal = { "close" },
			},
			-- offsets = {
			-- 	{
			-- 		filetype = "NvimTree",
			-- 		text = "File Explorer",
			-- 		text_align = "left" | "center" | "right",
			-- 		separator = true,
			-- 	},
			-- },
		},
	},
}
