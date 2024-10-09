local opt = { noremap = true, silent = true }
-- local opt = { noremap = true }
local k = vim.keymap.set
local ka = vim.api.nvim_set_keymap
vim.g.mapleader = " "

k("n", "<leader>mo", function() require("telescope").extensions.monorepo.monorepo() end)
k("n", "<leader>mt", function() require("monorepo").toggle_project() end)

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
k("n", "<leader>rj", "<cmd>ToggleTerm<cr>d -e 'make'<cr><cmd>ToggleTerm<cr>", opt)
k("n", "-", "<CMD>Oil<CR>", opt)

-- Copy paste
k("n", "<C-a>", "ggVG<cr>", opt)
k("n", "<leader>ya", 'ggVG"+y<cr>', opt)
k("n", "<leader>pa", 'ggVGx"+<S-p><cr>', opt)
k("n", "<leader>da", 'ggVGx"d<cr>', opt)
k("n", "cp", '"+y', opt)

-- MONO Repo
k("n", "<leader>maf", ":lua require('monorepo').add_project()<cr>", opt)
k("n", "<leader>mdd", ":lua require('monorepo').remove_project()<cr>", opt)

-- Utilities
-- k("n", "<leader>f", ":LspZeroFormat<cr>", opt)
k("n", "<leader>u", ":UndotreeToggle<cr>", opt)
k("n", "<leader>lo", ":LiveServer start<cr>", opt)
k("n", "<leader>lc", ":LiveServer stop<cr>", opt)
k("n", "<leader>WW", ":SudaWrite<cr>", opt)
k("n", "<leader>xr", ":call VrcQuery()<cr>", opt)

k("n", "<leader>rrn", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], opt)
k("n", "<leader>rn", ":IncRename ")
k("v", "<leader>or", ":s/\\(.*\\)/\1", opt)
k("n", "<leader>w", ":set wrap!<cr>", opt)
k("n", "<leader>hl", ":set hlsearch!<cr>", opt)
-- m("n", "<leader>to", ":term<cr>i", opt)
-- m("n", "<leader>mk", ":w:make<cr>:term<cr>i./hello<cr>", opt)

-- Trouble
k("n", "<leader>xx", function() require("trouble").toggle() end)
k("n", "<leader>xw", function() require("trouble").toggle("workspace_diagnostics") end)
k("n", "<leader>xd", function() require("trouble").toggle("document_diagnostics") end)
k("n", "<leader>xq", function() require("trouble").toggle("quickfix") end)
k("n", "<leader>xl", function() require("trouble").toggle("loclist") end)

-- CopilotChat
k("n", "<leader>co", ":CopilotChatToggle<cr>", opt)
k("i", "<C-i>", 'copilot#Accept("<CR>")', opt)
k("i", "<Tab>", '<Tab>', opt)
