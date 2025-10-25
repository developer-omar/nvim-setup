-- don't auto comment new line
vim.api.nvim_create_autocmd("BufEnter", { command = [[set formatoptions-=cro]] })

-- Highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking (copying) text",
	callback = function()
		vim.highlight.on_yank()
	end,
})

-- go to last loc when opening a buffer
-- this mean that when you open a file, you will be at the last position
vim.api.nvim_create_autocmd("BufReadPost", {
	callback = function()
		local mark = vim.api.nvim_buf_get_mark(0, '"')
		local lcount = vim.api.nvim_buf_line_count(0)
		if mark[1] > 0 and mark[1] <= lcount then
			pcall(vim.api.nvim_win_set_cursor, 0, mark)
		end
	end,
})

-- close some filetypes with <q>
vim.api.nvim_create_autocmd("FileType", {
	group = vim.api.nvim_create_augroup("close_with_q", { clear = true }),
	pattern = {
		"PlenaryTestPopup",
		"help",
		"lspinfo",
		"man",
		"notify",
		"qf",
		"spectre_panel",
		"startuptime",
		"tsplayground",
		"neotest-output",
		"checkhealth",
		"neotest-summary",
		"neotest-output-panel",
		"grug-far",
		"gitsigns-blame",
	},
	callback = function(event)
		vim.bo[event.buf].buflisted = false
		vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
	end,
})

-- Format on save a file using conform
-- vim.api.nvim_create_autocmd("BufWritePre", {
-- 	pattern = "*",
-- 	callback = function(args)
-- 		-- if vim.fn.executable("php-cs-fixer") == 1 then
-- 		-- else
-- 		-- end
-- 		require("conform").format({ bufnr = args.buf })
-- 	end,
-- })

-- Setting for integratin oil with snack's rename
vim.api.nvim_create_autocmd("User", {
	pattern = "OilActionsPost",
	callback = function(event)
		if event.data.actions.type == "move" then
			Snacks.rename.on_rename_file(event.data.actions.src_url, event.data.actions.dest_url)
		end
	end,
})

-- htmlangular behave like html file
vim.api.nvim_create_autocmd("FileType", {
	pattern = "htmlangular",
	callback = function()
		vim.bo.filetype = "html" -- Treat as html for LSP and completion
	end,
})

-- Setting htmlangular to html files if you are in a angular project
-- vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
-- 	pattern = "*.html",
-- 	callback = function()
-- 		if vim.fn.filereadable("angular.json") == 1 then
-- 			vim.bo.filetype = "htmlangular"
-- 		end
-- 	end,
-- })

-- vim.api.nvim_create_user_command("ToggleLineNumbers", function()
--   if vim.api.nvim_get_option_value("number", { scope = "global" }) then
--     vim.opt.number = false
--     vim.opt.relativenumber = false
--     print("Line numbers are disabled")
--   else
--     vim.opt.number = true
--     vim.opt.relativenumber = true
--     print("Line numbers are enabled")
--   end
-- end, { desc = "Toggle line numbers" })
--
-- vim.api.nvim_create_user_command("ToggleNeovimMouse", function()
--   local value = vim.api.nvim_get_option_value("mouse", { scope = "global" })
--   if value == "a" then
--     vim.opt.mouse = ""
--     print("Neovim's mouse is disabled")
--   else
--     vim.opt.mouse = "a"
--     print("Neovim's mouse is enabled")
--   end
-- end, { desc = "Enable/Disable Neovim's mouse" })

-- vim.api.nvim_create_user_command("RemoveTrailingWhitespaces", "%s/\\s\\+$//e", { desc = "Remove trailing whitespaces" })
