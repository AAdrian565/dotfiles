vim.keymap.set("v" , "<C-j>", ":m '>+1<CR>gv=gv")
vim.keymap.set("v" , "<C-k>", ":m '>-2<CR>gv=gv")

vim.keymap.set("n", "<C-e>", ":NvimTreeToggle<cr>")
vim.keymap.set("n", "<C-/>", ":CommentToggle")
vim.keymap.set("v", "<C-/>", ":CommentToggle")

vim.keymap.set("n", "<leader>rn", ":IncRename ")
