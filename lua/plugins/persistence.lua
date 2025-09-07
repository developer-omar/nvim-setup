-- https://github.com/folke/persistence.nvim
-- Persistence is a simple lua plugin for automated session management.

return {
	"folke/persistence.nvim",
	event = "BufReadPre", -- this will only start session saving when an actual file was opened
	opts = {
		-- add any custom options here
	},
}
