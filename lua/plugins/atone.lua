-- https://github.com/XXiaoA/atone.nvim
-- Instantly see the difference between the selected undo-history state and its parent.

return {
	"XXiaoA/atone.nvim",
	cmd = "Atone",
	opts = {
		layout = {
			---@type "left"|"right"
			---@type "left"|"right"
			direction = "right",
			width = 0.25,
		},
		-- shown under the tree graph
		diff_cur_node = {
			enabled = true,
			---@type number float less than 1
			--- The diff window's height is set to a specified percentage of the original (namely tree graph) window's height.
			split_percent = 0.5,
		},
	},
	keys = {
		{
			"<leader>cu",
			"<cmd>Atone toggle<cr>",
			desc = "Toggle UndoTree (Atone)",
		},
	},
}
