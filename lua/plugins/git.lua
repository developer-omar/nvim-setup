-- https://github.com/NeogitOrg/neogit
-- client for git

-- https://github.com/kdheepak/lazygit.nvim
-- Plugin for calling lazygit from within neovim.

return {
	{
		"NeogitOrg/neogit",
		lazy = true,
		dependencies = {
			"nvim-lua/plenary.nvim", -- required
			"sindrets/diffview.nvim", -- optional - Diff integration
			"ibhagwan/fzf-lua", -- optional
		},
		cmd = "Neogit",
		-- config = true,
		keys = {
			{ "<leader>gg", "<cmd>Neogit<cr>", desc = "Show Neogit UI" },
			{
				"<leader>gv",
				"<cmd>Neogit kind=vsplit<cr>",
				mode = "n",
				desc = "Open the status buffer in a vertical window",
			},
			{
				"<leader>gs",
				"<cmd>Neogit kind=split<cr>",
				mode = "n",
				desc = "Open the status buffer in a horizontal window",
			},
			{
				"<leader>gf",
				"<cmd>Neogit kind=floating<cr>",
				mode = "n",
				desc = "Open the status buffer in a floating window",
			},
		},
	},
	-- {
	-- 	"kdheepak/lazygit.nvim",
	-- 	lazy = true,
	-- 	cmd = {
	-- 		"LazyGit",
	-- 		"LazyGitConfig",
	-- 		"LazyGitCurrentFile",
	-- 		"LazyGitFilter",
	-- 		"LazyGitFilterCurrentFile",
	-- 	},
	-- 	-- optional for floating window border decoration
	-- 	dependencies = {
	-- 		"nvim-lua/plenary.nvim",
	-- 	},
	-- 	-- setting the keybinding for LazyGit with 'keys' is recommended in
	-- 	-- order to load the plugin when the command is run for the first time
	-- 	keys = {
	-- 		{ "<leader>gg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
	-- 		{ "<leader>gG", "<cmd>LazyGitCurrentFile<cr>", desc = "LazyGit Project Root of File" },
	-- 		{ "<leader>gc", "<cmd>LazyGitFilter<cr>", desc = "LazyGit Project Commits" },
	-- 		{ "<leader>gC", "<cmd>LazyGitFilterCurrentFile<cr>", desc = "LazyGit Buffer Commits" },
	-- 		{ "<leader>gk", "<cmd>LazyGitConfig<cr>", desc = "LazyGit Config File" },
	-- 	},
	-- },
}
