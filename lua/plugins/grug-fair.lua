-- https://github.com/MagicDuck/grug-far.nvim
-- Find And Replace plugin for neovim
-- For configuration, see more details in :h grug-far

return {
	"MagicDuck/grug-far.nvim",
	opts = { headerMaxWidth = 80 },
	cmd = "GrugFar",
	keys = {
		{
			"<leader>sr",
			function()
				local grug = require("grug-far")
				local ext = vim.bo.buftype == "" and vim.fn.expand("%:e")
				grug.open({
					transient = true,
					prefills = {
						filesFilter = ext and ext ~= "" and "*." .. ext or nil,
					},
				})
			end,
			mode = "n",
			desc = "Search and Replace",
		},
		{
			"<leader>sr",
			function()
				-- Aquí estás en modo visual, así que puedes usar '<,'> en un rango
				vim.cmd("'<,'>GrugFarWithin")
			end,
			mode = "v",
			desc = "Search and Replace (visual selection)",
		},
	},
}
