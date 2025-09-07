-- https://github.com/mbbill/undotree
-- Undotree visualizes the undo history and makes it easy to browse and switch
-- between different undo branches.
-- An alternative plugin written in lua is https://github.com/jiaoshijie/undotree

return {
	"mbbill/undotree",
	config = function(_, opts)
		vim.cmd([[
      " the values are 1,2,3,4
      let g:undotree_WindowLayout = 4
      " the values are 0,1
      let g:undotree_SetFocusWhenToggle = 1
    ]])
	end,
	keys = {
		{
			"<leader>cu",
			":UndotreeToggle<cr>",
			desc = "Toggle UndoTree",
		},
	},
}
