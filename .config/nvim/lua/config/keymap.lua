local opt = { noremap = true, silent = true }
local k = vim.keymap.set
local ka = vim.api.nvim_set_keymap
vim.g.mapleader = " "

-- Motion
ka("n", "gt", "<Plug>Titlecase", opt)
ka("v", "gt", "<Plug>Titlecase", opt)
ka("n", "gtt", "<Plug>TitlecaseLine", opt)

-- Basic Functionality
-- k("n", "<leader>y", '"+y', opt)
k("n", "<C-h>", "<C-w>h", opt)
k("n", "<C-j>", "<C-w>j", opt)
k("n", "<C-k>", "<C-w>k", opt)
k("n", "<C-l>", "<C-w>l", opt)
k("v", "J", ":m '>+1<CR>gv=gv", opt)
k("v", "K", ":m '<-2<CR>gv=gv", opt)
k("n", "<C-d>", "<C-d>zz", opt)
k("n", "<C-u>", "<C-u>zz", opt)
k("n", "<leader>w", ":set wrap!<cr>", opt)
k("n", "<leader>hl", ":set hlsearch!<cr>", opt)

-- Copy paste
k("n", "<C-a>", "ggVG<cr>", opt)
k("n", "<leader>ya", 'ggVG"+y<cr>', opt)
k("n", "<leader>pa", 'ggVGx"+<S-p><cr>', opt)
k("n", "<leader>da", 'ggVGx"d<cr>', opt)
k("n", "cp", '"+y', opt)
k("v", "cp", '"+y', opt)

-- PLUGINS
-- OIL
k("n", "-", "<CMD>Oil<CR>", opt)
-- Suda
k("n", "<leader>WW", ":SudaWrite<cr>", opt)
k("n", "<leader>u", ":UndotreeToggle<cr>", opt)
k("i", "<tab>", "<tab>", opt)
