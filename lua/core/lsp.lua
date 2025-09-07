local lspServers = {
	"lua_ls",
	"vimls",
	"html",
	"cssls",
	"css_variables",
	-- 'tailwindcss',
	"emmet_language_server",
	"intelephense",
	"yamlls",
	"marksman",
	"twiggy_language_server",
	"vue_ls",
	"vtsls",
	"angularls",
	"laravel_ls",
}

vim.lsp.enable(lspServers)

-- Diagnostic Config
-- See :help vim.diagnostic.Opts
vim.diagnostic.config({
	-- virtual_lines = true,
	virtual_text = true,
	underline = true,
	update_in_insert = false,
	severity_sort = true,
	float = {
		border = "rounded",
		source = true,
	},
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = "󰅚 ",
			[vim.diagnostic.severity.WARN] = "󰀪 ",
			[vim.diagnostic.severity.INFO] = "󰋽 ",
			[vim.diagnostic.severity.HINT] = "󰌶 ",
		},
		numhl = {
			[vim.diagnostic.severity.ERROR] = "ErrorMsg",
			[vim.diagnostic.severity.WARN] = "WarningMsg",
		},
	},
})
