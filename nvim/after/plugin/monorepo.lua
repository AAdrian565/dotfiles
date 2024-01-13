local mr = require("monorepo")

vim.keymap.set("n", "<leader>maf", ":lua require('monorepo').add_project()<cr>", {})
vim.keymap.set("n", "<leader>pd", ":Telescope monorepo<cr>", {})
