-- https://github.com/neovim/nvim-lspconfig
-- nvim-lspconfig is a "data only" repo, providing basic, default Nvim LSP client configurations
-- for various LSP servers. View all configs or :help lspconfig-all from Nvim.

-- https://github.com/mason-org/mason.nvim
-- is a Neovim plugin that allows you to easily manage external editor tooling such as LSP servers,
-- DAP servers, linters, and formatters through a single interface

-- https://github.com/mason-org/mason-lspconfig.nvim
-- allow you to (i) automatically install, and (ii) automatically enable (vim.lsp.enable()) installed servers

-- https://github.com/WhoIsSethDaniel/mason-tool-installer.nvim
-- Install or upgrade all of your third-party tools. Uses Mason to do nearly all the work.

return {
	"neovim/nvim-lspconfig",
	dependencies = {
		{
			"mason-org/mason.nvim",
			opts = {
				ui = {
					icons = {
						package_installed = "✓",
						package_pending = "➜",
						package_uninstalled = "✗",
					},
				},
			},
		},
		{
			"mason-org/mason-lspconfig.nvim",
		},
		{
			"WhoIsSethDaniel/mason-tool-installer.nvim",
		},
		"saghen/blink.cmp",
	},
	opts = {
		folds = {
			enabled = true,
		},
	},
	config = function()
		--------------------------- NECESSARY LSP CONFIGURATIONS -------------------------------------------------
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
				map("gr", vim.lsp.buf.references, "Goto References")
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
					and client_supports_method(
						client,
						vim.lsp.protocol.Methods.textDocument_documentHighlight,
						event.buf
					)
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
				if
					client
					and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_inlayHint, event.buf)
				then
					map("<leader>ch", function()
						vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }))
					end, "Toggle Inlay Hints")
				end
			end,
		})

		-- Diagnostic Config
		-- See :help vim.diagnostic.Opts
		vim.diagnostic.config({
			severity_sort = true,
			float = { border = "rounded", source = "if_many" },
			underline = { severity = vim.diagnostic.severity.ERROR },
			signs = vim.g.have_nerd_font and {
				text = {
					[vim.diagnostic.severity.ERROR] = "󰅚 ",
					[vim.diagnostic.severity.WARN] = "󰀪 ",
					[vim.diagnostic.severity.INFO] = "󰋽 ",
					[vim.diagnostic.severity.HINT] = "󰌶 ",
				},
			} or {},
			virtual_text = {
				source = "if_many",
				spacing = 2,
				format = function(diagnostic)
					local diagnostic_message = {
						[vim.diagnostic.severity.ERROR] = diagnostic.message,
						[vim.diagnostic.severity.WARN] = diagnostic.message,
						[vim.diagnostic.severity.INFO] = diagnostic.message,
						[vim.diagnostic.severity.HINT] = diagnostic.message,
					}
					return diagnostic_message[diagnostic.severity]
				end,
			},
		})

		------------------- INSTALLING LSP SERVERS AND OTHER TOOLS --------------------------------------------

		-- local capabilities = require("blink.cmp").get_lsp_capabilities()

		local lspServers = {
			lua_ls = {},
			vimls = {},
			html = {},
			cssls = {},
			css_variables = {},
			tailwindcss = {},
			emmet_language_server = {},
			intelephense = {},
			yamlls = {},
			marksman = {},
			twiggy_language_server = {},
			vue_ls = {},
			vtsls = {},
			angularls = {},
			laravel_ls = {},
			rnix = {},
			-- gopls = {},
		}

		local otherTools = {
			-- FORMATTERS
			"stylua", -- Lua
			-- "php-cs-fixer", -- Needing PHP is installed
			"prettier", -- Web and Markdown
			"shfmt", -- Shell and Bash
			"isort", -- Python
			"black", -- Python
			"djlint", -- Django templates
			"blade-formatter", -- Blade templates
			"yamlfix",
			-- "htmlbeautifier", -- Needing Ruby is installed
			-- LINTERS
			"luacheck",
			"eslint_d",
			"pylint",
			"phpcs",
			"htmlhint",
			"stylelint",
			"golangci-lint",
			"markdownlint",
			"yamllint",
			"nixfmt",
		}
		-- You can add other tools (formatters, linters, etc) - Mason will install
		local ensure_installed = vim.tbl_keys(lspServers or {})
		vim.list_extend(ensure_installed, otherTools)

		require("mason-tool-installer").setup({ ensure_installed = ensure_installed })

		require("mason-lspconfig").setup({
			ensure_installed = {},
			automatic_installation = false,
			handlers = {
				function(server_name)
					local server = lspServers[server_name] or {}
					-- server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
					require("lspconfig")[server_name].setup(server)
				end,
			},
		})
	end,
}
