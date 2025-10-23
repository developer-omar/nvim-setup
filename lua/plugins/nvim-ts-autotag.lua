-- https://github.com/windwp/nvim-ts-autotag
-- Use treesitter to autoclose and autorename html tag

return {
	"windwp/nvim-ts-autotag",
	event = "VeryLazy",
	opts = {
		per_filetype = {
			enable_close = false,
		},
	},
}
