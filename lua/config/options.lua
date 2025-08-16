vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.opt.number = true
vim.opt.relativenumber = false
-- Use spaces instead of tabs
vim.opt.expandtab = true 
-- Number of spaces tabs count for
vim.opt.tabstop = 2 
-- Size of an indent
vim.opt.shiftwidth = 2 
-- Round indent
vim.opt.shiftround = true 
-- Enable mouse mode
vim.opt.mouse = "a" 
-- Sync clipboard between OS and Neovim.
vim.schedule(function()
  vim.opt.clipboard = "unnamedplus"
end)
-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
-- vim.api.nvim_set_hl(0, 'LineNr', { fg = "white"}) -- highlighting current line

-- vim.opt.list = true
-- vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣', lead = '·' }
-- Show which line your cursor is on
vim.opt.cursorline = true 
-- Termguicolors is enabled
vim.opt.termguicolors = true 
-- Minimal number of screen lines to keep above and below the cursor.
vim.opt.scrolloff = 10
-- if performing an operation that would fail due to unsaved changes in the buffer (like `:q`),
-- instead raise a dialog asking if you wish to save the current file(s)
-- See `:help 'confirm'`
vim.opt.confirm = true
