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

local function redact_text(text)
    local redacted = {}

    for i = 0, vim.fn.strchars(text) - 1 do
        local char = vim.fn.strcharpart(text, i, 1)
        redacted[#redacted + 1] = char:match("%s") and char or "*"
    end

    return table.concat(redacted)
end

function _G.redact_operator(type)
    local start = vim.fn.getpos("'[")
    local finish = vim.fn.getpos("']")

    if start[2] == 0 or finish[2] == 0 then
        return
    end

    if type == "line" then
        local first_line = math.min(start[2], finish[2]) - 1
        local last_line = math.max(start[2], finish[2])
        local lines = vim.api.nvim_buf_get_lines(0, first_line, last_line, true)

        for i, line in ipairs(lines) do
            lines[i] = redact_text(line)
        end

        vim.api.nvim_buf_set_lines(0, first_line, last_line, true, lines)
        return
    end

    local start_row, start_col = start[2] - 1, start[3] - 1
    local end_row, end_col = finish[2] - 1, finish[3]
    local selected = vim.api.nvim_buf_get_text(0, start_row, start_col, end_row, end_col, {})

    for i, line in ipairs(selected) do
        selected[i] = redact_text(line)
    end

    vim.api.nvim_buf_set_text(0, start_row, start_col, end_row, end_col, selected)
    vim.api.nvim_win_set_cursor(0, { start[2], start[3] })
end
