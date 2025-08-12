return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    indent = { enabled = true },
    input = { enabled = true },
    notifier = { enabled = true },
    scope = { enabled = true },
    scroll = { enabled = true },
    statuscolumn = { enabled = true },
    toogle = { enabled = true },
    words = { enabled = true },
    bigfile = { enabled = true },
    quickfile = { enabled = true },
    explorer = { enabled = true },
    picker = { enabled = true }
    -- dashboard = { enabled = true },
  },
  keys = {
    { "<leader>n", function()
      if Snacks.config.picker and Snacks.config.picker.enabled then
        Snacks.picker.notifications()
      else
        Snacks.notifier.show_history()
      end
    end, desc = "Notification History" },
    { "<leader>un", function() Snacks.notifier.hide() end, desc = "Dismiss All Notifications" },
    { "<leader>:", function() Snacks.picker.command_history() end, desc = "Command History" },
    { "<leader>e", function() Snacks.explorer() end, desc = "File Explorer" },
    { "<leader>/", function() Snacks.picker.grep() end, desc = "Grep" },
    { "<leader>,", function() Snacks.picker.buffers() end, desc = "Buffers" },
  },
}
