local startup_dir = vim.fn.getcwd(-1, -1)

vim.keymap.set({ "n", "x" }, "<C-p>", function()
    if vim.fn.executable("pi") ~= 1 then
        vim.notify("pi executable not found in PATH", vim.log.levels.ERROR)
        return
    end
    require("snacks").terminal.toggle({ "pi" }, {
        cwd = startup_dir,
        count = 1,
        win = {
            position = "float",
            width = 0.9,
            height = 0.85,
            border = "rounded",
            title = " Pi ",
            keys = {
                term_normal = false,
                toggle_pi = {
                    "<C-p>",
                    function(win)
                        vim.cmd("stopinsert")
                        win:hide()
                    end,
                    mode = { "n", "t" },
                    desc = "Hide Pi",
                },
            },
        },
    })
end, { desc = "Toggle Pi terminal", silent = true })

vim.keymap.set("n", "<leader>ai", "<cmd>PiAsk<cr>", { desc = "Ask Pi about current file" })
vim.keymap.set("x", "<leader>ai", ":PiAskSelection<cr>", { desc = "Ask Pi about selection" })
