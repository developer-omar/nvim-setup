-- https://github.com/ibhagwan/fzf-lua
-- Fzf-lua aims to be as plug and play as possible with sane defaults
-- Use F1 to show keymaps when you are using fzf in nvim

return {
	"ibhagwan/fzf-lua",
	-- optional for icon support
	dependencies = { "nvim-tree/nvim-web-devicons" },
	opts = {
		winopts = {
			fullscreen = false, -- Use the picker in fullscreen
			preview = {
				layout = "vertical", -- flex|horizontal|vertical default flex
				vertical = "down:55%",
			},
		},
		files = {
			-- executed command priority is 'cmd' (if exists)
			-- otherwise auto-detect prioritizes `fd`:`rg`:`find`
			-- default options are controlled by 'fd|rg|find|_opts'
			fd_opts = [[--color=never --hidden --type f --type l --exclude .git --exclude node_modules]],
		},
	},
	keys = {
		-- Find
		{ "<leader>ff", "<cmd>FzfLua files<cr>", desc = "Find Files" },
		{ "<leader>fc", "<cmd>FzfLua files cwd=~/.config/nvim<cr>", desc = "Find Config Files" },
		{ "<leader>fb", "<cmd>FzfLua buffers sort_mru=true sort_lastused=true<cr>", desc = "Buffers" },
		{ "<leader>fg", "<cmd>FzfLua git_files<cr>", desc = "Find Files (git-files)" },
		{ "<leader>fr", "<cmd>FzfLua oldfiles<cr>", desc = "Recent" },
		{ "<leader>ft", "<cmd>FzfLua treesitter<cr>", desc = "Current Buffer Treesitter Symbols" },
		-- { "<leader>fc", LazyVim.pick.config_files(), desc = "Find Config File" },
		-- { "<leader>fF", LazyVim.pick("files", { root = false }), desc = "Find Files (cwd)" },

		-- Git
		{ "<leader>gc", "<cmd>FzfLua git_commits<CR>", desc = "Commits" },
		{ "<leader>gC", "<cmd>FzfLua git_bcommits<CR>", desc = "Commits Buffer" },
		{ "<leader>gs", "<cmd>FzfLua git_status<CR>", desc = "Status" },
		{ "<leader>gb", "<cmd>FzfLua git_branches<CR>", desc = "Branches" },
		-- { "<leader>gB", "<cmd>FzfLua git_blame<CR>", desc = "Blame" },
		{ "<leader>gt", "<cmd>FzfLua git_tags<CR>", desc = "Tags" },
		{ "<leader>gS", "<cmd>FzfLua git_stash<CR>", desc = "Stash" },

		-- Search
		{ '<leader>s"', "<cmd>FzfLua registers<cr>", desc = "Registers" },
		{ "<leader>sa", "<cmd>FzfLua autocmds<cr>", desc = "Auto Commands" },
		-- { "<leader>sb", "<cmd>FzfLua grep_curbuf<cr>", desc = "Buffer" },
		{ "<leader>sc", "<cmd>FzfLua command_history<cr>", desc = "Command History" },
		{ "<leader>sC", "<cmd>FzfLua commands<cr>", desc = "Commands" },
		{ "<leader>sd", "<cmd>FzfLua diagnostics_document<cr>", desc = "Document Diagnostics" },
		{ "<leader>sD", "<cmd>FzfLua diagnostics_workspace<cr>", desc = "Workspace Diagnostics" },
		{ "<leader>sg", "<cmd>FzfLua live_grep<cr>", desc = "Grep Current Project" },
		{ "<leader>s/", "<cmd>FzfLua live_grep_resume<cr>", desc = "Continue Last Grep Current Project" },
		-- { "<leader>sg", LazyVim.pick("live_grep"), desc = "Grep (Root Dir)" },
		-- { "<leader>sG", LazyVim.pick("live_grep", { root = false }), desc = "Grep (cwd)" },
		-- { "<leader>sh", "<cmd>FzfLua help_tags<cr>", desc = "Help Pages" },
		{ "<leader>sH", "<cmd>FzfLua highlights<cr>", desc = "Search Highlight Groups" },
		{ "<leader>sj", "<cmd>FzfLua jumps<cr>", desc = "Jumplist" },
		{ "<leader>sk", "<cmd>FzfLua keymaps<cr>", desc = "Key Maps" },
		{ "<leader>sl", "<cmd>FzfLua loclist<cr>", desc = "Location List" },
		{ "<leader>sM", "<cmd>FzfLua man_pages<cr>", desc = "Man Pages" },
		{ "<leader>sh", "<cmd>FzfLua helptags<cr>", desc = "Help Tags" },
		{ "<leader>sm", "<cmd>FzfLua marks<cr>", desc = "Jump to Mark" },
		{ "<leader>sR", "<cmd>FzfLua resume<cr>", desc = "Resume" },
		{ "<leader>sq", "<cmd>FzfLua quickfix<cr>", desc = "Quickfix List" },
		{ "<leader>sw", "<cmd>FzfLua grep_cword<cr>", desc = "Search word under cursor" },
		{ "<leader>sW", "<cmd>FzfLua grep_cWORD<cr>", desc = "Search WORD under cursor" },
		{ "<leader>sw", "<cmd>FzfLua grep_visual<cr>", mode = "v", desc = "Selection visual selection" },

		-- Others
		{ "<leader>:", "<cmd>FzfLua command_history<cr>", desc = "Command History" },
		{ "<leader><space>", "<cmd>FzfLua buffers sort_mru=true sort_lastused=true<cr>", desc = "Find Buffer" },
		{ "<leader>uC", "<cmd>FzfLua colorschemes<cr>", desc = "Colorscheme with Preview" },
		{ "<leader>oz", "<cmd>FzfLua zoxide<cr>", desc = "Open Zoxide" },
		-- {
		--   "<leader>ss",
		--   function()
		--     require("fzf-lua").lsp_document_symbols({
		--       regex_filter = symbols_filter,
		--     })
		--   end,
		--   desc = "Goto Symbol",
		-- },
		-- {
		--   "<leader>sS",
		--   function()
		--     require("fzf-lua").lsp_live_workspace_symbols({
		--       regex_filter = symbols_filter,
		--     })
		--   end,
		--   desc = "Goto Symbol (Workspace)",
		-- },
	},
}
