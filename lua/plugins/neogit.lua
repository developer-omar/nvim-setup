-- https://github.com/NeogitOrg/neogit
-- client for git

return {
	"NeogitOrg/neogit",
	dependencies = {
		"nvim-lua/plenary.nvim", -- required
		"sindrets/diffview.nvim", -- optional - Diff integration
		"ibhagwan/fzf-lua", -- optional
	},
	config = true,
	keys = {
		{ "<leader>go", "<cmd>Neogit kind=replace<cr>", mode = "n", desc = "Open the status buffer" },
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
}
