vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight when yanking (copying) text",
    group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})

vim.api.nvim_create_autocmd({ "BufWritePre" }, {
    pattern = { "*" },
    callback = function(ev)
        if not vim.bo[ev.buf].modifiable then
            return
        end
        local save_cursor = vim.fn.getpos(".")
        vim.cmd([[%s/\s\+$//e]])
        vim.fn.setpos(".", save_cursor)
    end,
})

vim.api.nvim_create_autocmd("FileType", {
    pattern = "lazygit",
    callback = function()
        vim.keymap.set("t", "<C-g>", "<cmd>close<cr>", { buffer = true, silent = true })
        vim.keymap.set("n", "<leader>gg", "<cmd>close<cr>", { buffer = true, silent = true })
    end,
})
