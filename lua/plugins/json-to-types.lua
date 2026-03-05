-- https://github.com/redoxahmii/json-to-types.nvim
-- A Neovim plugin designed to simplify the process of generating type definitions from JSON

return {
	"Redoxahmii/json-to-types.nvim",
	build = "sh install.sh npm", -- Replace `npm` with your preferred package manager (e.g., yarn, pnpm).
	ft = "json",
	keys = {
		{
			"<leader>cU",
			"<CMD>ConvertJSONtoLang typescript<CR>",
			desc = "Convert JSON to TS",
		},
		{
			"<leader>ct",
			"<CMD>ConvertJSONtoLangBuffer dart<CR>",
			desc = "Convert JSON to TS Buffer",
		},
	},
}
