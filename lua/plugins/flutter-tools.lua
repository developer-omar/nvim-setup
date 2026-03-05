-- https://github.com/nvim-flutter/flutter-tools.nvim
-- Build flutter and dart applications in neovim using the native LSP

return {
	"nvim-flutter/flutter-tools.nvim",
	lazy = false,
	dependencies = {
		"nvim-lua/plenary.nvim",
		"stevearc/dressing.nvim", -- optional for vim.ui.select
	},
	config = true,
}
