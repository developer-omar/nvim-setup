-- https://github.com/Saghen/blink.cmp
-- blink.cmp is a completion plugin with support for LSPs, cmdline, signature help, and snippets.

-- https://github.com/folke/lazydev.nvim?
-- lazydev.nvim is a plugin that properly configures LuaLS for editing your Neovim config by
-- lazily updating your workspace libraries.

return {
	{
		"folke/lazydev.nvim",
		ft = "lua", -- only load on lua files
		opts = {
			library = {
				-- Load luvit types when the `vim.uv` word is found
				{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
				{ path = "snacks.nvim", words = { "Snacks" } },
			},
		},
	},

	{
		-- Autocompletion
		"saghen/blink.cmp",
		event = { "InsertEnter", "CmdlineEnter" },
		version = "1.*",
		dependencies = {
			-- Snippet Engine
			{
				"L3MON4D3/LuaSnip",
				version = "2.*",
				build = (function()
					-- Build Step is needed for regex support in snippets.
					-- This step is not supported in many windows environments.
					-- Remove the below condition to re-enable on windows.
					if vim.fn.has("win32") == 1 or vim.fn.executable("make") == 0 then
						return
					end
					return "make install_jsregexp"
				end)(),
				dependencies = {
					{
						"rafamadriz/friendly-snippets",
						config = function()
							require("luasnip.loaders.from_vscode").lazy_load()
							-- User snippets
							local configPath = vim.fn.stdpath("config")
							require("luasnip.loaders.from_vscode").lazy_load({ paths = { configPath .. "/snippets" } })
						end,
					},
				},
				opts = {},
			},
		},
		opts = {
			-- Disable/Enable blink in cmdline
			cmdline = {
				enabled = true,
			},

			keymap = {
				-- <c-e>: Hide menu
				-- <c-k>: Toggle signature help
				--
				-- See :h blink-cmp-config-keymap for defining your own keymap
				preset = "enter",
				["<c-k>"] = { "select_prev", "fallback" },
				["<c-j>"] = { "select_next", "fallback" },

				-- For more advanced Luasnip keymaps (e.g. selecting choice nodes, expansion) see:
				--    https://github.com/L3MON4D3/LuaSnip?tab=readme-ov-file#keymaps
			},

			appearance = {
				-- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
				-- Adjusts spacing to ensure icons are aligned
				nerd_font_variant = "normal",
			},

			completion = {
				list = {
					selection = { preselect = true, auto_insert = false },
				},
				-- By default, you may press `<c-space>` to show the documentation.
				documentation = { auto_show = true, auto_show_delay_ms = 500 },
			},
			signature_help = {
				enable = true,
			},

			sources = {
				default = { "lazydev", "lsp", "path", "snippets", "buffer" },
				providers = {
					lazydev = {
						name = "LazyDev",
						module = "lazydev.integrations.blink",
						score_offset = 100,
					},
					snippets = {
						opts = {
							friendly_snippets = true,
							-- Adding framework snippets to a filetype
							extended_filetypes = {
								typescript = { "angular" },
							},
						},
					},
				},
			},

			-- snippets = { preset = "luasnip" },

			-- Blink.cmp includes an optional, recommended rust fuzzy matcher,
			-- which automatically downloads a prebuilt binary when enabled.
			--
			-- By default, we use the Lua implementation instead, but you may enable
			-- the rust implementation via `'prefer_rust_with_warning'`
			--
			-- See :h blink-cmp-config-fuzzy for more information
			fuzzy = { implementation = "lua" },

			-- Shows a signature help window while you type arguments for a function
			signature = { enabled = true },
		},
	},
}
