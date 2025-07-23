local harpoon = require("harpoon")

-- REQUIRED
harpoon:setup()
-- REQUIRED

vim.keymap.set("n", "<leader>haf", function()
	harpoon:list():add()
end)
vim.keymap.set("n", "<leader>ho", function()
	harpoon.ui:toggle_quick_menu(harpoon:list())
end)

-- Toggle previous & next buffers stored within Harpoon list
vim.keymap.set("n", "<S-h>", function()
	harpoon:list():prev()
end)
vim.keymap.set("n", "<S-l>", function()
	harpoon:list():next()
end)
