-- https://github.com/kdheepak/lazygit.nvim
-- Plugin for calling lazygit from within neovim.

return {
	"kdheepak/lazygit.nvim",
	lazy = true,
	cmd = {
		"LazyGit",
		"LazyGitConfig",
		"LazyGitCurrentFile",
		"LazyGitFilter",
		"LazyGitFilterCurrentFile",
	},
	-- optional for floating window border decoration
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	-- setting the keybinding for LazyGit with 'keys' is recommended in
	-- order to load the plugin when the command is run for the first time
	keys = {
		{ "<leader>gg", "<cmd>LazyGit<cr>", desc = "LazyGit" },
		{ "<leader>gG", "<cmd>LazyGitCurrentFile<cr>", desc = "LazyGit Project Root of File" },
		{ "<leader>gc", "<cmd>LazyGitFilter<cr>", desc = "LazyGit Project Commits" },
		{ "<leader>gC", "<cmd>LazyGitFilterCurrentFile<cr>", desc = "LazyGit Buffer Commits" },
		{ "<leader>gk", "<cmd>LazyGitConfig<cr>", desc = "LazyGit Config File" },
	},
}
