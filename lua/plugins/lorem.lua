-- https://github.com/derektata/lorem.nvim
-- Easily generate dummy text in Neovim
return {
	"derektata/lorem.nvim",
	config = function()
		require("lorem").opts({
			sentenceLength = "medium",
			comma_chance = 0.2,
			max_commas = 2,
			mappings = { "<tab>" },
		})
	end,
}
