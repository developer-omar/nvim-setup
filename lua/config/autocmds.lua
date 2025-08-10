vim.api.nvim_create_user_command("ToggleLineNumbers", function()
  if vim.api.nvim_get_option_value("number", { scope = "global" }) then
    vim.opt.number = false
    vim.opt.relativenumber = false
    print("Line numbers are disabled")
  else
    vim.opt.number = true
    vim.opt.relativenumber = true
    print("Line numbers are enabled")
  end
end, { desc = "Toggle line numbers" })

vim.api.nvim_create_user_command("ToggleNeovimMouse", function()
  local value = vim.api.nvim_get_option_value("mouse", { scope = "global" })
  if value == "a" then
    vim.opt.mouse = ""
    print("Neovim's mouse is disabled")
  else
    vim.opt.mouse = "a"
    print("Neovim's mouse is enabled")
  end
end, { desc = "Enable/Disable Neovim's mouse" })

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

vim.api.nvim_create_user_command("RemoveTrailingWhitespaces", "%s/\\s\\+$//e", { desc = "Remove trailing whitespaces" })
