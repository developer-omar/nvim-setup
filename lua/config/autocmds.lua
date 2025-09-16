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

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
	callback = function(event)
		local map = function(keys, func, desc, mode)
			mode = mode or "n"
			vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc, silent = true })
		end

		-- Rename the variable under your cursor.
		map("<leader>cr", vim.lsp.buf.rename, "Rename")
		map("gd", vim.lsp.buf.definition, "Go to Definition")
		map("gD", vim.lsp.buf.declaration, "Goto Declaration")
		-- Execute a code action, usually your cursor needs to be on top of an error
		map("gI", vim.lsp.buf.implementation, "Goto Implementation")
		map("gr", vim.lsp.buf.references, "Goto References") -- TODO: fix this keymap in whichkey
		map("gy", vim.lsp.buf.type_definition, "Goto Type Definition")
		map("gK", vim.lsp.buf.signature_help, "Signature Help")
		map("<c-k>", vim.lsp.buf.signature_help, "Signature Help", { "i" })
		map("K", vim.lsp.buf.hover, "Hover Documentation")
		map("<leader>ov", "<cmd>vsplit | lua vim.lsp.buf.definition()<cr>", "Goto Definition in Vertical Split")
		map("<leader>ca", vim.lsp.buf.code_action, "Code Action", { "n", "v" })
		map("<leader>cd", vim.diagnostic.open_float, "Open Diagnostic Float")
		-- map("<leader>cf", vim.lsp.buf.format, "Format Code")

		-- This function resolves a difference between neovim nightly (version 0.11) and stable (version 0.10)
		---@param client vim.lsp.Client
		---@param method vim.lsp.protocol.Method
		---@param bufnr? integer some lsp support methods only in specific files
		---@return boolean
		local function client_supports_method(client, method, bufnr)
			if vim.fn.has("nvim-0.11") == 1 then
				return client:supports_method(method, bufnr)
			else
				return client.supports_method(method, { bufnr = bufnr })
			end
		end

		-- The following two autocommands are used to highlight references of the
		-- word under your cursor when your cursor rests there for a little while.
		--    See `:help CursorHold` for information about when this is executed
		--
		-- When you move your cursor, the highlights will be cleared (the second autocommand).
		local client = vim.lsp.get_client_by_id(event.data.client_id)
		if
			client
			and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_documentHighlight, event.buf)
		then
			local highlight_augroup = vim.api.nvim_create_augroup("lsp-highlight", { clear = false })
			vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
				buffer = event.buf,
				group = highlight_augroup,
				callback = vim.lsp.buf.document_highlight,
			})

			vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
				buffer = event.buf,
				group = highlight_augroup,
				callback = vim.lsp.buf.clear_references,
			})

			vim.api.nvim_create_autocmd("LspDetach", {
				group = vim.api.nvim_create_augroup("lsp-detach", { clear = true }),
				callback = function(event2)
					vim.lsp.buf.clear_references()
					vim.api.nvim_clear_autocmds({ group = "lsp-highlight", buffer = event2.buf })
				end,
			})
		end

		-- The following code creates a keymap to toggle inlay hints in your
		-- code, if the language server you are using supports them
		--
		-- This may be unwanted, since they displace some of your code
		if client and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_inlayHint, event.buf) then
			map("<leader>ch", function()
				vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }))
			end, "Toggle Inlay Hints")
		end
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
