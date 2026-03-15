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
	keys = {
		-- Execution and Debbuging
		{ "<leader>lfr", "<cmd>FlutterRun<cr>", desc = "Run The Current Project" },
		{ "<leader>lfd", "<cmd>FlutterDebug<cr>", desc = "Run Current Project In Debug Mode" },
		{ "<leader>lfR", "<cmd>FlutterRestart<cr>", desc = "Restart The Current Project" },
		{ "<leader>lfL", "<cmd>FlutterReload<cr>", desc = "Reload The Running Project" },
		{ "<leader>lfq", "<cmd>FlutterQuit<cr>", desc = "Ends A Running Session" },
		-- Devices and Emulators
		{ "<leader>lfv", "<cmd>FlutterDevices<cr>", desc = "Show A List of Connected Devices" },
		{ "<leader>lfe", "<cmd>FlutterEmulators<cr>", desc = "Show A List of Emulators" },
		{ "<leader>lfa", "<cmd>FlutterAttach<cr>", desc = "Attach To A Running App" },
		{ "<leader>lfD", "<cmd>FlutterDetach<cr>", desc = "Ends A Running Session Locally" },
		-- Tools and DevTools
		{ "<leader>lft", "<cmd>FlutterDevTools<cr>", desc = "Start A Dart Dev Tools Server" },
		{ "<leader>lfT", "<cmd>FlutterDevToolsActivate<cr>", desc = "Activates A Dart Dev Tools Server" },
		{ "<leader>lfp", "<cmd>FlutterCopyProfilerUrl<cr>", desc = "Copy The Profiler URL" },
		-- Outline and Navigation
		{ "<leader>lfo", "<cmd>FlutterOutlineOpen<cr>", desc = "Show The Widget Tree Window" },
		{ "<leader>lfO", "<cmd>FlutterOutlineToggle<cr>", desc = "Toggle The Widget Tree Window" },
		{ "<leader>lfs", "<cmd>FlutterSuper<cr>", desc = "Go To Super Class/Method" },
		-- LSP and Maintenance
		{ "<leader>lfl", "<cmd>FlutterLspRestart<cr>", desc = "Restart The Dart Language Server" },
		{ "<leader>lfA", "<cmd>FlutterReanalyze<cr>", desc = "Reanalyze Using Custom LSP Method dart/reanalyze" },
		{ "<leader>lfN", "<cmd>FlutterRename<cr>", desc = "Rename And Update Imports" },
		{ "<leader>lfc", "<cmd>FlutterLogClear<cr>", desc = "Clear The Log Buffer" },
		{ "<leader>lfC", "<cmd>FlutterLogToggle<cr>", desc = "Toggle The Log Buffer" },
	},
}
