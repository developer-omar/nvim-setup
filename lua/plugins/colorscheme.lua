return {
	{
		"zaldih/themery.nvim",
		lazy = false,
		config = function()
			local opts = {
				themes = {
					"tokyonight-night",
					"tokyonight-storm",
					-- "tokyonight-day",
					"tokyonight-moon",
					-- "catppuccin-latte",
					"catppuccin-frappe",
					"catppuccin-macchiato",
					"catppuccin-mocha",
					-- "github_dark",
					-- "github_dark_default",
					-- "github_dark_dimmed",
					-- "github_dark_high_contrast",
					-- "github_dark_colorblind",
					-- "github_dark_tritanopia",
					-- "onedark",
					-- "onedark_vivid",
					-- "onedark_dark",
					-- "kanagawa", -- have other styles
					-- "rose-pine-main",
					-- "rose-pine-moon",
					-- "rose-pine-dawn",
					-- "everforest", -- have other styles
					-- "material", -- have other styles
					-- "dracula",
					-- "nord",
					-- "nordic",
					-- "night-owl",
					-- "onelight",
					-- "flow", -- have other styles
					-- "fluoromachine",
					-- "nightfox",
					-- "duskfox",
					-- "nordfox",
					-- "terafox",
					-- "carbonfox",
				},
				livePreview = true,
			}
			require("themery").setup(opts)
		end,
	},

	{
		"folke/tokyonight.nvim",
		lazy = true,
		opts = { style = "moon" },
	},

	{
		"catppuccin/nvim",
		lazy = true,
		name = "catppuccin",
		opts = {
			integrations = {
				aerial = true,
				alpha = true,
				cmp = { enabled = true, border = true },
				dashboard = true,
				flash = true,
				grug_far = true,
				gitsigns = true,
				headlines = true,
				illuminate = true,
				indent_blankline = { enabled = true },
				leap = true,
				lsp_trouble = true,
				mason = true,
				markdown = true,
				mini = true,
				native_lsp = {
					enabled = true,
					underlines = {
						errors = { "undercurl" },
						hints = { "undercurl" },
						warnings = { "undercurl" },
						information = { "undercurl" },
					},
				},
				navic = { enabled = true, custom_bg = "lualine" },
				neotest = true,
				neotree = true,
				noice = true,
				notify = true,
				semantic_tokens = true,
				snacks = true,
				telescope = true,
				treesitter = true,
				treesitter_context = true,
				which_key = { enabled = true, border = true },
			},
		},
		specs = {
			{
				"akinsho/bufferline.nvim",
				optional = true,
				opts = function(_, opts)
					if (vim.g.colors_name or ""):find("catppuccin") then
						opts.highlights = require("catppuccin.groups.integrations.bufferline").get()
					end
				end,
			},
		},
		color_overrides = {
			all = {
				-- MsgSeparator = { bg = C.mantle },
			},
		},
	},

	-- {
	-- 	"projekt0n/github-nvim-theme",
	-- 	name = "github-theme",
	-- },

	-- {
	-- 	"olimorris/onedarkpro.nvim",
	-- 	priority = 1000, -- Ensure it loads first
	-- },

	-- {
	--   "rebelot/kanagawa.nvim",
	--   opts = {
	--     theme = "wave", -- Load "wave" theme when 'background' option is not set
	--     background = { -- map the value of 'background' option to a theme
	--       dark = "wave", -- wave or dragon
	--       light = "lotus",
	--     },
	--   },
	-- },

	-- {
	--   "rose-pine/neovim",
	--   name = "rose-pine",
	--   -- vim.cmd("colorscheme rose-pine-main")
	--   -- vim.cmd("colorscheme rose-pine-moon")
	--   -- vim.cmd("colorscheme rose-pine-dawn")
	-- },

	-- {
	--   "neanias/everforest-nvim",
	--   version = false,
	--   lazy = false,
	--   priority = 1000, -- make sure to load this before all the other start plugins
	--   -- Optional; default configuration will be used if setup isn't called.
	--   config = function()
	--     require("everforest").setup({
	--       background = "hard",
	--     })
	--   end,
	-- },

	-- {
	--   "marko-cerovac/material.nvim",
	--   opts = {
	--     plugins = { -- Uncomment the plugins that you use to highlight them
	--       -- Available plugins:
	--       -- "coc",
	--       -- "colorful-winsep",
	--       "dap",
	--       -- "dashboard",
	--       -- "eyeliner",
	--       -- "fidget",
	--       "flash",
	--       "gitsigns",
	--       "harpoon",
	--       -- "hop",
	--       -- "illuminate",
	--       -- "indent-blankline",
	--       -- "lspsaga",
	--       "mini",
	--       -- "neogit",
	--       -- "neotest",
	--       "neo-tree",
	--       -- "neorg",
	--       "noice",
	--       "nvim-cmp",
	--       -- "nvim-navic",
	--       -- "nvim-tree",
	--       -- "nvim-web-devicons",
	--       -- "rainbow-delimiters",
	--       -- "sneak",
	--       "telescope",
	--       "trouble",
	--       "which-key",
	--       -- "nvim-notify",
	--     },
	--   },
	--   config = function()
	--     -- available options darker, ligher, oceanic, palenight, deep ocean
	--     vim.g.material_style = "palenight"
	--   end,
	-- },

	-- {
	--   "Mofiqul/dracula.nvim",
	-- },

	-- {
	--   "shaunsingh/nord.nvim",
	-- },

	-- {
	--   "AlexvZyl/nordic.nvim",
	--   lazy = false,
	--   priority = 1000,
	--   config = function()
	--     require("nordic").load()
	--   end,
	-- },

	-- {
	--   "oxfist/night-owl.nvim",
	--   lazy = false, -- make sure we load this during startup if it is your main colorscheme
	--   priority = 1000, -- make sure to load this before all the other start plugins
	--   -- config = function()
	--   --   require("night-owl").setup()
	--   --   vim.cmd.colorscheme("night-owl")
	--   -- end,
	-- },

	-- {
	--   "0xstepit/flow.nvim",
	--   lazy = false,
	--   priority = 1000,
	--   opts = {},
	--   config = function()
	--     require("flow").setup({
	--       dark_theme = true, -- Set the theme with dark background.
	--       high_contrast = false, -- Make the dark background darker or the light background lighter.
	--       transparent = false, -- Set transparent background.
	--       fluo_color = "pink", -- Color used as fluo. Available values are pink, yellow, orange, or green.
	--       mode = "base", -- Mode of the colors. Available values are: dark, bright, desaturate, or base.
	--       aggressive_spell = false, -- Use colors for spell check.
	--     })
	--   end,
	-- },

	-- {
	--   "maxmx03/fluoromachine.nvim",
	--   lazy = false,
	--   priority = 1000,
	--   config = function()
	--     local fm = require("fluoromachine")
	--     fm.setup({
	--       glow = true,
	--       theme = "delta", -- retrowave, delta, fluoromachine
	--       transparent = true,
	--     })
	--   end,
	-- },

	-- {
	--   "EdenEast/nightfox.nvim",
	-- },

	-- -- {
	-- --   "LazyVim/LazyVim",
	-- --   opts = {
	-- --     colorscheme = "dracula",
	-- --   },
	-- -- },
}
