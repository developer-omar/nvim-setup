
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.expandtab = true -- Use spaces instead of tabs
vim.opt.tabstop = 2 -- Number of spaces tabs count for
vim.opt.shiftwidth = 2 -- Size of an indent
vim.opt.shiftround = true -- Round indent
vim.opt.mouse = "a" -- Enable mouse mode
-- Sync clipboard between OS and Neovim.
vim.schedule(function()
  vim.opt.clipboard = "unnamedplus"
end)
-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
-- vim.opt.list = true
-- vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣', lead = '·' }
-- vim.api.nvim_set_hl(0, 'LineNr', { fg = "white"}) -- highlighting current line
vim.opt.cursorline = true -- Show which line your cursor is on
vim.opt.termguicolors = true -- Termguicolors is enabled
