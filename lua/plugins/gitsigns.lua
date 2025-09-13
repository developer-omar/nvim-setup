-- https://github.com/lewis6991/gitsigns.nvim
-- Deep buffer integration for Git

return {
	"lewis6991/gitsigns.nvim",
	lazy = true,
	-- This plugin is lazy and is enabled before reading a file or create a new file
	event = { "BufReadPre", "BufNewFile" },
	-- TODO: set keymap q to close Blame buffer
	keys = {
		{
			"[[",
			function()
				require("gitsigns").nav_hunk("prev")
			end,
			desc = "Previous Git Hunk",
		},
		{
			"]]",
			function()
				require("gitsigns").nav_hunk("next")
			end,
			desc = "Next Git Hunk",
		},

		{
			"<leader>gB",
			"<cmd>Gitsigns blame<cr>",
			desc = "Blame",
		},
		{
			"<leader>gl",
			function()
				require("gitsigns").blame_line()
			end,
			desc = "Blame Line",
		},
		{
			"<leader>gR",
			function()
				require("gitsigns").reset_buffer()
			end,
			desc = "Reset Buffer",
		},

		{
			"<leader>ghr",
			function()
				require("gitsigns").reset_hunk()
			end,
			desc = "Reset Hunk",
		},
		{
			"<leader>ghs",
			function()
				require("gitsigns").stage_hunk()
			end,
			desc = "Stage Hunk",
		},
		{
			"<leader>ghu",
			function()
				require("gitsigns").stage_hunk()
			end,
			desc = "Undo Stage Hunk",
		},
		{
			"<leader>ghp",
			function()
				require("gitsigns").preview_hunk()
			end,
			desc = "Preview Hunk",
		},
		{
			"<leader>ghi",
			function()
				require("gitsigns").preview_hunk_inline()
			end,
			desc = "Preview Hunk Inline",
		},
	},
}
