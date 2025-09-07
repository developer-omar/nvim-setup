-- https://github.com/matthiasweiss/angular-quickswitch.nvim
-- I usually only use the shortcut to toggle between the class definition and template of an Angular component.

return {
	"matthiasweiss/angular-quickswitch.nvim",
	opts = {},
	keys = {
		{
			"<Leader>oc",
			"<Cmd>NgQuickSwitchComponent<CR>",
			mode = { "n", "x" },
			desc = "Open Angular Component File",
			silent = true,
		},
		{
			"<Leader>ot",
			"<Cmd>NgQuickSwitchTemplate<CR>",
			mode = { "n", "x" },
			desc = "Open Angular Template File",
			silent = true,
		},
		{
			"<Leader>oT",
			"<Cmd>NgQuickSwitchTest<CR>",
			mode = { "n", "x" },
			desc = "Open Angular Test File",
			silent = true,
		},
	},
}
