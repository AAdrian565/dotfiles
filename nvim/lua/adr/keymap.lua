vim.keymap.set("v" , "<C-j>", ":m '>+1<CR>gv=gv")
vim.keymap.set("v" , "<C-k>", ":m '>-2<CR>gv=gv")

vim.keymap.set("n", "<C-e>", ":NvimTreeToggle<cr>")
vim.keymap.set("n", "<C-/>", ":CommentToggle<cr>")
vim.keymap.set("v", "<C-/>", ":CommentToggle<cr>")

vim.keymap.set("n", "<leader>rn", ":IncRename ")
vim.keymap.set("n", "<leader>f", ":Format<cr>")
