vim.g.mapleader = " "

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
-- vim.keymap.set("n", "n", "nzzzv")
-- vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("n", "<C-a>", "ggVG<cr>")
vim.keymap.set("n", "<leader>ya", "ggVG\"+y<cr>")
vim.keymap.set("n", "<leader>pa", "ggVGx\"+p<cr>")

vim.keymap.set("n", "<C-e>", ":NERDTreeToggle<cr>")
vim.keymap.set("n", "<leader>d", ":NERDTreeFind<cr>")
-- vim.keymap.set("n", "<leader>sds", ":SudaWrite<cr>")
vim.keymap.set("n", "<leader>WW", ":SudaWrite<cr>")

vim.keymap.set("n", "<leader>rn", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("v", "<leader>or", ":s/\\(.*\\)/\1")
vim.keymap.set("n", "<leader>f", ":LspZeroFormat<cr>")
vim.keymap.set("n", "<leader>U", ":UndotreeToggle<cr>")
vim.keymap.set("n", "<leader>lo", ":LiveServer start<cr>")
vim.keymap.set("n", "<leader>lc", ":LiveServer stop<cr>")
