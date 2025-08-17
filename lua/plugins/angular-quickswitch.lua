return {
  "matthiasweiss/angular-quickswitch.nvim",
  opts = {},
  keys = {
    {
      "<Leader>oc",
      "<Cmd>NgQuickSwitchComponent<CR>",
      mode = { "n", "x" },
      desc = "Open Angular Component File"
    },
    {
      "<Leader>ot",
      "<Cmd>NgQuickSwitchTemplate<CR>",
      mode = { "n", "x" },
      desc = "Open Angular Template File"
    },
    {
      "<Leader>oT",
      "<Cmd>NgQuickSwitchTest<CR>",
      mode = { "n", "x" },
      desc = "Open Angular Test File"
    },

  },
}
