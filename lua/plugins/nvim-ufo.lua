return {
	"kevinhwang91/nvim-ufo",
	dependencies = {
		{ "kevinhwang91/promise-async" },
	},
	event = "BufRead",
	keys = {
		{
			"zR",
			function()
				require("ufo").openAllFolds()
			end,
			desc = "Abrir todos los pliegues",
		},
		{
			"zM",
			function()
				require("ufo").closeAllFolds()
			end,
			desc = "Close all the Folds",
		},
		{
			"K",
			function()
				local winid = require("ufo").peekFoldedLinesUnderCursor()
				if not winid then
					vim.lsp.buf.hover()
				end
			end,
			desc = "Vista previa del pliegue o hover de LSP",
		},
	},
	opts = {
		provider_selector = function(_, filetype, _)
			return { "treesitter", "indent" }
		end,
		close_fold_kinds_for_ft = {
			default = { "imports", "comment" },
		},
	},
	config = function(_, opts)
		vim.o.foldcolumn = "1"
		vim.o.foldlevel = 99
		vim.o.foldlevelstart = 99
		vim.o.foldenable = true
		require("ufo").setup(opts)
	end,
}
