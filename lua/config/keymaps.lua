-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")
vim.keymap.set("i", "jk", "<ESC>")
vim.keymap.set("n", "<leader>K", "<cmd>norm! K<cr>", { desc = "Keywordprg" })
-- vim.keymap.set("n", "<leader>l", "<cmd>Lazy<cr>", { desc = "Lazy" })

-- TIP: Disable arrow keys in normal mode
vim.keymap.set("n", "<left>", '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set("n", "<right>", '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set("n", "<up>", '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set("n", "<down>", '<cmd>echo "Use j to move!!"<CR>')

-- Paste over currently selected text without yanking it
-- _ is related to black hole register
vim.keymap.set("v", "p", '"_dp')
vim.keymap.set("v", "P", '"_dP')

-- copy everything between { and } including the brackets
-- vim.keymap.set("n", "YY", "va{Vy", opts)
vim.keymap.set("n", "YY", "va{y", { desc = "Copy a block between {}" })

-- Select all
vim.keymap.set("n", "<C-a>", "ggVG", { desc = "Select all" })

-- delete forward
-- w{number}dw
-- delete backward
-- w{number}db

-- Enahace the searches
vim.keymap.set("n", "n", "nzz")
vim.keymap.set("n", "N", "Nzz")
vim.keymap.set("n", "*", "*zz")
vim.keymap.set("n", "#", "#zz")
vim.keymap.set("n", "g*", "g*zz", { desc = "Search without matching whole words" })
vim.keymap.set("n", "g#", "g#zz", { desc = "Backward search without matching whole words" })

-- Remap for dealing with visual line wraps
-- util when you have vim.vo.wrap=true al
vim.keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true })
vim.keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true })

vim.keymap.set("n", "<c-n>", "}", { desc = "Next Paragraph" })
vim.keymap.set("n", "<c-p>", "{", { desc = "Previous Paragraph" })

vim.keymap.set({ "i", "n", "v" }, "<c-c>", [[<c-\><c-n>]], { desc = "Escape From Other Modes" })
vim.keymap.set({ "n" }, "gC", "gUwlguwh", { desc = "Capitalize A Word" })

-- Buffers
-- Uncomment this part if you uninstall Bufferline plugin
-- vim.keymap.set("n", "<s-l>", ":bnext<cr>", { desc = "Next Buffer", silent = true })
-- vim.keymap.set("n", "<s-h>", ":bprevious<cr>", { desc = "Previous Buffer", silent = true })
vim.keymap.set("n", "<leader>bD", "<cmd>:bd<cr>", { desc = "Delete Buffer And Window", silent = true })
vim.keymap.set("n", "<leader>bd", function()
	Snacks.bufdelete()
end, { desc = "Delete buffer", silent = true })
-- vim.keymap.set("n", "<leader>bq", ":%bd|e#|bd#<cr>", { desc = "Delete Other Buffers", silent = true })
vim.keymap.set("n", "<leader>bq", function()
	Snacks.bufdelete.other()
end, { desc = "Delete Other Buffers", silent = true })

-- <c-o>b<c-o>de is to delete a word without a whitespace
vim.keymap.set("i", "<c-d>", "<c-o>b<c-o>dw", { desc = "Delete A Word In Insert Mode" })
-- vim.keymap.set("n", "<c-d>", "bdw", { desc = "Delete a word in normal mode" })

-- Duplicate
vim.keymap.set({ "n", "i" }, "<a-d>", "<cmd>t .<cr>", { desc = "Duplicate A Line", silent = true })
vim.keymap.set("v", "<a-d>", "y:'><cr>o<esc>p==", { desc = "Duplicate A Block Of Lines", silent = true })

-- vim.keymap.set("n", "<a-k>", ":m .-2<cr>==", { desc = "Move a line up", silent = true })
-- vim.keymap.set("n", "<a-j>", ":m .+1<cr>==", { desc = "Move a line down", silent = true })
-- vim.keymap.set("i", "<a-k>", "<c-o><cmd>m -2<cr><c-o>==", { desc = "Move a line up", silent = true })
-- vim.keymap.set("i", "<a-j>", "<c-o><cmd>m +1<cr><c-o>==", { desc = "Move a line down", silent = true })
-- vim.keymap.set("v", "<a-k>", ":m '<-2<cr>gv=gv", { desc = "Move a selection up", silent = true })
-- vim.keymap.set("v", "<a-j>", ":m '>+1<cr>gv=gv", { desc = "Move a selection down", silent = true })

-- Windows
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

vim.keymap.set({ "n", "i", "v" }, "<c-s>", "<esc><cmd>w<cr>", { desc = "Save file", silent = true })

vim.keymap.set("v", ">", ">gv", { desc = "Indent a selection", silent = true })
vim.keymap.set("v", "<", "<gv", { desc = "Dedent a selection", silent = true })
