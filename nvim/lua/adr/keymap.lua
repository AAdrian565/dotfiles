local opt = { noremap = true, silent = true }
-- local opt = { noremap = true }
k = vim.keymap.set
vim.g.mapleader = " "

vim.g.copilot_no_tab_map = true
vim.g.copilot_assume_mapped = true
vim.api.nvim_set_keymap("i", "<C-i>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
vim.keymap.set("n", "<leader>mo", function()
  require("telescope").extensions.monorepo.monorepo()
end)
vim.keymap.set("n", "<leader>mt", function()
  require("monorepo").toggle_project()
end)
-- Bacic Functionality
k("n", "<C-h>", "<C-w>h", opt)
k("n", "<C-j>", "<C-w>j", opt)
k("n", "<C-k>", "<C-w>k", opt)
k("n", "<C-l>", "<C-w>l", opt)
k("v", "J", ":m '>+1<CR>gv=gv", opt)
k("v", "K", ":m '<-2<CR>gv=gv", opt)
k("n", "<C-d>", "<C-d>zz", opt)
k("n", "<C-u>", "<C-u>zz", opt)
k("n", "<leader>rj", "<cmd>ToggleTerm<cr>d -e 'make'<cr><cmd>ToggleTerm<cr>", opt)

-- Copy paste
k("n", "<C-a>", "ggVG<cr>", opt)
k("n", "<leader>ya", "ggVG\"+y<cr>", opt)
k("n", "<leader>pa", "ggVGx\"+p<cr>", opt)
k("n", "<leader>yl", "V\"+y<cr>", opt)

-- NERD Tree
k("n", "<C-s>", ":NERDTreeToggle<cr>", opt)
k("n", "<leader>s", ":NERDTreeFind<cr>", opt)

-- MONO Repo
k("n", "<leader>maf", ":lua require('monorepo').add_project()<cr>", opt)
k("n", "<leader>mdd", ":lua require('monorepo').remove_project()<cr>", opt)
-- Terminal
k("t", "<cr>", "<cr>", opt)
k("t", "<C-x>", "<cmd>ToggleTerm<cr>", opt)
k("n", "<C-x>", "<cmd>ToggleTerm<cr>", opt)

-- Harpoon
k("n", "<leader>ho", ":lua require(\"harpoon.ui\").toggle_quick_menu()<cr>", opt)
k("n", "<leader>haf", ":lua require(\"harpoon.mark\").add_file()<cr>", opt)
k("n", "<S-H>", ":lua require(\"harpoon.ui\").nav_prev()<cr>", opt)
k("n", "<S-L>", ":lua require(\"harpoon.ui\").nav_next()<cr>", opt)

-- Utilities
k("n", "<leader>f", ":LspZeroFormat<cr>", opt)
k("n", "<leader>u", ":UndotreeToggle<cr>", opt)
k("n", "<leader>lo", ":LiveServer start<cr>", opt)
k("n", "<leader>lc", ":LiveServer stop<cr>", opt)
k("n", "<leader>WW", ":SudaWrite<cr>", opt)

k("n", "<leader>rrn", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], opt)
k("n", "<leader>rn", ":IncRename ")
k("v", "<leader>or", ":s/\\(.*\\)/\1", opt)
k("n", "<leader>w", ":set wrap!<cr>", opt)
-- m("n", "<leader>to", ":term<cr>i", opt)
-- m("n", "<leader>mk", ":w:make<cr>:term<cr>i./hello<cr>", opt)
