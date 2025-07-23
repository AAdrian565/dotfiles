local file_ignore_patterns = {
    "node_modules/*",
    "^%.svelte%-kit/*",
    "^%.cache/*",
    "^%.git/.*",
    "build/.*",
    "fonts/.*",
    "[Rr]unner/.*",
    "[Rr]unner.xcodeproj/.*",
    "[Rr]unner.xcworkspace/.*",
    ".*%.o$",
    ".*%.bin$",
    ".*%.png$",
    ".*%.jpg$",
    ".*%.lock$",
    ".*%-lock.json$",
}

require("telescope").setup({
    defaults = {
        file_ignore_patterns = file_ignore_patterns,
        mappings = {
            n = {
                ["g?"] = "which_key",
            },
        },
    },
})

local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>pf", ":Telescope find_files find_command=rg,--ignore,--hidden,--files<cr>", {})
vim.keymap.set("n", "<C-p>", builtin.git_files, {})
vim.keymap.set("n", "<leader>ps", function()
    builtin.grep_string({ search = vim.fn.input("Grep > "), file_ignore_patterns = file_ignore_patterns })
end)

