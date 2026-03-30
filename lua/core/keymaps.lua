local options = { silent = true } ---@type vim.keymap.set.Opts

vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.keymap.set("n", "<a-Q>", "<cmd>qa!<cr>")
vim.keymap.set("n", "<a-q>", "<cmd>qa<cr>")

vim.keymap.set("n", "<a-S>", "<cmd>wa!<cr>")
vim.keymap.set("n", "<a-s>", "<cmd>w!<cr>")

vim.keymap.set("n", "<a-C>", "<cmd>clo<cr>")
vim.keymap.set("n", "<a-c>", "<cmd>bp|sp|bn|bw!<cr>")
vim.keymap.set("n", "<s-tab>", "<cmd>bp<cr>")
vim.keymap.set("n", "<tab>", "<cmd>bn<cr>")

vim.keymap.set("n", "<a-i>", "<c-w>s")
vim.keymap.set("n", "<a-o>", "<c-w>v")

vim.keymap.set("n", "<a-P>", "<c-w>10+")
vim.keymap.set("n", "<a-U>", "<c-w>10-")
vim.keymap.set("n", "<a-p>", "<c-w>10>")
vim.keymap.set("n", "<a-u>", "<c-w>10<")

vim.keymap.set("n", "<a-h>", "<c-w>h")
vim.keymap.set("n", "<a-j>", "<c-w>j")
vim.keymap.set("n", "<a-k>", "<c-w>k")
vim.keymap.set("n", "<a-l>", "<c-w>l")

vim.keymap.set("n", "[j", "<c-o>")
vim.keymap.set("n", "]j", "<c-i>")

vim.keymap.set("n", "[q", "<cmd>cp<cr>")
vim.keymap.set("n", "]q", "<cmd>cn<cr>")

vim.keymap.set("n", "U", "<c-r>")

vim.keymap.set("n", "<a-v>", "<c-v>")

vim.keymap.set("x", "<", "<gv")
vim.keymap.set("x", ">", ">gv")
vim.keymap.set("x", "J", ":m'>+1<cr>gv=gv", options)
vim.keymap.set("x", "K", ":m'<-2<cr>gv=gv", options)
