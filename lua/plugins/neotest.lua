-- https://github.com/nvim-neotest/neotest
-- A framework for interacting with tests within NeoVim.
-- See :h neotest for details on neotest is designed and how to interact with it programmatically.

return {
	"nvim-neotest/neotest",
	dependencies = {
		"nvim-neotest/nvim-nio",
		"nvim-lua/plenary.nvim",
		"antoinemadec/FixCursorHold.nvim",
		"nvim-treesitter/nvim-treesitter",
		-- adapters
		"marilari88/neotest-vitest",
		"nvim-neotest/neotest-go",
		"olimorris/neotest-phpunit",
		"V13Axel/neotest-pest",
		"nvim-neotest/neotest-python",
		"sidlatau/neotest-dart",
		"nvim-neotest/neotest-plenary",
		"codymikol/neotest-kotlin",
	},
	config = function()
		require("neotest").setup({
			adapters = {
				-- Javascript and Typescript
				require("neotest-vitest")({
					-- Filter directories when searching for test files.
					-- Useful in large projects (see Filter directories notes).
					filter_dir = function(name, rel_path, root)
						return name ~= "node_modules"
					end,
				}),
				-- Go
				require("neotest-go"),
				-- PHP
				require("neotest-phpunit")({
					phpunit_cmd = "vendor/bin/phpunit",
					filter_dirs = { "vendor", "node_modules", ".git" },
				}),
				require("neotest-pest"),
				-- Python
				require("neotest-python")({
					dap = { justMyCode = false },
				}),
				-- Dart and Flutter
				require("neotest-dart")({
					command = "flutter",
					use_lsp = true,
				}),
				-- Kotlin
				require("neotest-kotlin"),

				require("neotest-plenary"),
			},
		})
	end,
	keys = {
		{ "<leader>t", "", desc = "+test" },
		{
			"<leader>tf",
			function()
				require("neotest").run.run(vim.fn.expand("%"))
			end,
			desc = "Run File (Neotest)",
		},
		{
			"<leader>ta",
			function()
				require("neotest").run.attach()
			end,
			desc = "Attach to Test (Neotest)",
		},
		{
			"<leader>tA",
			function()
				require("neotest").run.run(vim.uv.cwd())
			end,
			desc = "Run All Test Files (Neotest)",
		},
		{
			"<leader>tn",
			function()
				require("neotest").run.run()
			end,
			desc = "Run Nearest (Neotest)",
		},
		{
			"<leader>tl",
			function()
				require("neotest").run.run_last()
			end,
			desc = "Run Last (Neotest)",
		},
		{
			"<leader>ts",
			function()
				require("neotest").summary.toggle()
			end,
			desc = "Toggle Summary (Neotest)",
		},
		{
			"<leader>to",
			function()
				require("neotest").output.open({ enter = true, auto_close = true })
			end,
			desc = "Show Output (Neotest)",
		},
		{
			"<leader>tO",
			function()
				require("neotest").output_panel.toggle()
			end,
			desc = "Toggle Output Panel (Neotest)",
		},
		{
			"<leader>tS",
			function()
				require("neotest").run.stop()
			end,
			desc = "Stop (Neotest)",
		},
		{
			"<leader>tw",
			function()
				require("neotest").watch.toggle(vim.fn.expand("%"))
			end,
			desc = "Toggle Watch (Neotest)",
		},
	},
}
