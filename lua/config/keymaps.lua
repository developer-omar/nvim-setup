
vim.keymap.set({ "i", "n", "v" }, "<c-c>", [[<c-\><c-n>]], { desc = "Escape from other modes" })

vim.keymap.set("n", "<tab>", ":bnext<cr>", { desc = "Next buffer", silent = true })
vim.keymap.set("n", "<s-tab>", ":bprevious<cr>", { desc = "Previous buffer", silent = true })

-- <c-o>b<c-o>de is to delete a word without a whitespace
vim.keymap.set("i", "<c-d>", "<c-o>b<c-o>dw", { desc = "Delete a word in insert mode" })
vim.keymap.set("n", "<c-d>", "bdw", { desc = "Delete a word in normal mode" })
vim.keymap.set("n", "<leader>bq", ":%bd|e#|bd#<cr>", { desc = "Delete Other Buffers", silent = true })

vim.keymap.set({ "n", "i" }, "<a-d>", "<cmd>t .<cr>", { desc = "Duplicate a line", silent = true })
vim.keymap.set("v", "<a-d>", "y:'><cr>o<esc>p==", { desc = "Duplicate a block of lines", silent = true })

vim.keymap.set("n", "<a-k>", ":m .-2<cr>==", { desc = "Move a line up", silent = true })
vim.keymap.set("n", "<a-j>", ":m .+1<cr>==", { desc = "Move a line down", silent = true })
vim.keymap.set("i", "<a-k>", "<c-o><cmd>m -2<cr><c-o>==", { desc = "Move a line up", silent = true})
vim.keymap.set("i", "<a-j>", "<c-o><cmd>m +1<cr><c-o>==", { desc = "Move a line down", silent = true })
vim.keymap.set("v", "<a-k>", ":m '<-2<cr>gv=gv", { desc = "Move a selection up", silent = true })
vim.keymap.set("v", "<a-j>", ":m '>+1<cr>gv=gv", { desc = "Move a selection down", silent = true })

vim.keymap.set("n", "<c-h>", "<c-w><c-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<c-j>", "<c-w><c-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<c-k>", "<c-w><c-k>", { desc = "Move focus to the upper window" })
vim.keymap.set("n", "<c-l>", "<c-w><c-l>", { desc = "Move focus to the right window" })

vim.keymap.set("n", "<c-right>", "<c-w>>", { desc = "Increase the width of the current window" })
vim.keymap.set("n", "<c-left>", "<c-w><", { desc = "Decrease the width of the current window" })
vim.keymap.set("n", "<c-up>", "<c-w>+", { desc = "Increase the height of the current window" })
vim.keymap.set("n", "<c-down>", "<c-w>-", { desc = "Decrease the height of the current window" })
vim.keymap.set("n", "<leader>wd", "<c-w>c", { desc = "Delete the current window" })
vim.keymap.set("n", "<leader>wD", "<c-w>o", { desc = "Delete all other windows" })
vim.keymap.set("n", "<leader>ws", "<cmd>split<cr>", { desc = "Create a horizontal split", silent = true })
vim.keymap.set("n", "<leader>wv", "<cmd>vsplit<cr>", { desc = "Create a vertical split", silent = true })

vim.keymap.set("n", "<c-s>", "<cmd>RemoveTrailingWhitespaces<cr><cmd>update<cr>", { desc = "Save file", silent = true })
vim.keymap.set("v", "<c-s>", "<c-c><cmd>RemoveTrailingWhitespaces<cr><cmd>update<cr>", { desc = "Save file", silent = true })
vim.keymap.set("i", "<c-s>", "<c-c><cmd>RemoveTrailingWhitespaces<cr><cmd>update<cr>", { desc = "Save file", silent = true })

vim.keymap.set("v", ">", ">gv", { desc = "Indent a selection", silent = true })
vim.keymap.set("v", "<", "<gv", { desc = "Dedent a selection", silent = true })

vim.keymap.set("n", "<leader>bd", "<cmd>bdelete<cr>", { desc = "Delete buffer", silent = true })
