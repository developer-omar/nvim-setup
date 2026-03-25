-- https://github.com/VPavliashvili/json-nvim?tab=readme-ov-file
-- json-nvim is a NeoVim plugin that aims to vastly improve json editing
-- and processing experience with help of jq and Neovim Treesitter

return {
	"VPavliashvili/json-nvim",
	-- ft = { "json" },
	config = function()
		vim.keymap.set("n", "<leader>lF", "", { desc = "format json" })
		vim.keymap.set("n", "<leader>lFf", "<cmd>JsonFormatFile<cr>", { desc = "Format Json File" })
		vim.keymap.set("v", "<leader>lFs", "<cmd>JsonFormatSelection<cr>", { desc = "Format Json Selection" })
	end,
}
