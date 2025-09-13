-- https://github.com/sQVe/sort.nvim
-- Sort is a Neovim plugin for intelligent line and delimiter sorting.

return {
	"sQVe/sort.nvim",
	config = function()
		require("sort").setup({
			-- Optional configuration overrides.
		})
	end,
}
