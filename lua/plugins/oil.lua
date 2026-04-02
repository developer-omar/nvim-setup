-- https://github.com/stevearc/oil.nvim
-- A vim-vinegar like file explorer that lets you edit your filesystem like a normal Neovim buffer.

-- https://github.com/simaxme/oil-angular-schematics.nvim
-- A simple plugin that allows the creation of angular schematics inside your oil window.

return {
	{
		"simaxme/oil-angular-schematics.nvim",

		version = "*", -- for stable releases
	},
	{
		"stevearc/oil.nvim",
		---@module 'oil'
		---@type oil.SetupOpts
		opts = {
			view_options = {
				show_hidden = true,
			},
		},
		-- Optional dependencies
		dependencies = { { "echasnovski/mini.icons", opts = {} } },
		-- dependencies = { "nvim-tree/nvim-web-devicons" }, -- use if prefer nvim-web-devicons
		keys = {
			{ "-", "<cmd>Oil<cr>", mode = "n", desc = "Open A Parent Directory" },
			{
				"<leader>las",
				function()
					require("oil-angular-schematics").create_angular_schematic()
				end,
				mode = "n",
				desc = "Open Angular Schematics",
			},
		},
	},
}
