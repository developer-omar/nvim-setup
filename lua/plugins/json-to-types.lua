-- https://github.com/redoxahmii/json-to-types.nvim
-- A Neovim plugin designed to simplify the process of generating type definitions from JSON

return {
	"Redoxahmii/json-to-types.nvim",
	build = "sh install.sh npm", -- Replace `npm` with your preferred package manager (e.g., yarn, pnpm).
	ft = "json",
	keys = {
		{
			"<leader>ltb",
			"<CMD>ConvertJSONtoLangBuffer<CR>",
			desc = "Select Language For Generating Types In A Buffer",
		},
		{
			"<leader>ltf",
			"<CMD>ConvertJSONtoLang<CR>",
			desc = "Select Language For Generating Types In A File",
		},
		{
			"<leader>ltt",
			"<CMD>ConvertJSONtoLangBuffer typescript<CR>",
			desc = "Convert JSON to Typescript",
		},
		{
			"<leader>ltj",
			"<CMD>ConvertJSONtoLangBuffer javascript<CR>",
			desc = "Convert JSON to Javascript",
		},
		{
			"<leader>lty",
			"<CMD>ConvertJSONtoLangBuffer python<CR>",
			desc = "Convert JSON to Python",
		},
		{
			"<leader>ltp",
			"<CMD>ConvertJSONtoLangBuffer php<CR>",
			desc = "Convert JSON to PHP",
		},
		{
			"<leader>ltg",
			"<CMD>ConvertJSONtoLangBuffer go<CR>",
			desc = "Convert JSON to Go",
		},
		{
			"<leader>ltd",
			"<CMD>ConvertJSONtoLangBuffer dart<CR>",
			desc = "Convert JSON to Dart",
		},
		{
			"<leader>ltJ",
			"<CMD>ConvertJSONtoLangBuffer java<CR>",
			desc = "Convert JSON to Java",
		},
	},
}
