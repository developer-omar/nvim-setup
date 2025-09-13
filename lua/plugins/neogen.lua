-- https://github.com/danymat/neogen
-- Create annotations with one keybind, and jump your cursor in the inserted annotation

return {
	"danymat/neogen",
	config = function()
		require("neogen").setup({})
		vim.keymap.set(
			"n",
			"<leader>cgc",
			"<cmd>lua require('neogen').generate({type = 'class'})<cr>",
			{ desc = "Generate Class Annotation", silent = true }
		)
		vim.keymap.set(
			"n",
			"<leader>cgf",
			"<cmd>lua require('neogen').generate({type = 'func'})<cr>",
			{ desc = "Generate Function Annotation", silent = true }
		)
		vim.keymap.set(
			"n",
			"<leader>cgt",
			"<cmd>lua require('neogen').generate({type = 'type'})<cr>",
			{ desc = "Generate Function Annotation", silent = true }
		)
		vim.keymap.set(
			"n",
			"<leader>cgF",
			"<cmd>lua require('neogen').generate({type = 'file'})<cr>",
			{ desc = "Generate File Annotation", silent = true }
		)
		-- Jump among placeholders
		-- TODO: Change for use tab and s-tab, configurating in blink-cmp

		local opts = { noremap = true, silent = true }
		vim.api.nvim_set_keymap("i", "<C-l>", "<cmd>lua require('neogen').jump_next()<cr>", opts)
		vim.api.nvim_set_keymap("i", "<C-h>", "<cmd>lua require('neogen').jump_prev()<cr>", opts)
	end,
}
