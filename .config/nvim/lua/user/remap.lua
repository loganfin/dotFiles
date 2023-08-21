vim.g.mapleader = " "

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

vim.keymap.set("n", "<c-d>", "<c-d>zz")
vim.keymap.set("n", "<c-u>", "<c-u>zz")

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- split navigation
vim.keymap.set("n", "<a-=>", "<c-w>=")
vim.keymap.set("n", "<a-z>", "<c-w><bar><c-w>_")
vim.keymap.set("n", "<a-h>", "<c-w>h")
vim.keymap.set("n", "<a-j>", "<c-w>j")
vim.keymap.set("n", "<a-k>", "<c-w>k")
vim.keymap.set("n", "<a-l>", "<c-w>l")

-- open terminal
vim.keymap.set("n", "<leader>tt", "<cmd>terminal<cr><cmd>startinsert<cr>")
vim.keymap.set("n", "<leader>tv", "<cmd>vnew<cr><cmd>terminal<cr><cmd>startinsert<cr>")
vim.keymap.set("n", "<leader>th", "<cmd>new<cr><cmd>terminal<cr><cmd>startinsert<cr>")

-- terminal naviagtion
vim.keymap.set("t", "<esc>", [[<c-\><c-n>]])
vim.keymap.set("t", "<a-=>", "<c-w>=")
vim.keymap.set("t", "<a-z>", "<c-w><bar><c-w>_")
vim.keymap.set("t", "<a-h>", "<c-w>h")
vim.keymap.set("t", "<a-j>", "<c-w>j")
vim.keymap.set("t", "<a-k>", "<c-w>k")
vim.keymap.set("t", "<a-l>", "<c-w>l")


-- yank to the system clipboard
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

-- move the blocked up (J) or down (K)
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- paste without changing the content of the copy buffer
vim.keymap.set("x", "<leader>p", "\"_dP")

-- delete without changing the content of the copy buffer
vim.keymap.set("n", "<leader>d", "\"_d")
vim.keymap.set("v", "<leader>d", "\"_d")

-- format the code
vim.keymap.set("n", "<leader>gq", function()
    local view = vim.fn.winsaveview()
    vim.cmd('execute \"normal gggqG\"')
    vim.fn.winrestview(view)
end)
