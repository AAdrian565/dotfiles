local opt = { noremap = true, silent = true }
-- local opt = { noremap = true }
local k = vim.keymap.set
vim.g.mapleader = " "

function EncodeURL()
    local selected_text = vim.fn.getreg('"', 1, 1)
    local encoded_text = selected_text:gsub("[^%w]", function(c)
        return string.format("%%%02X", string.byte(c))
    end)
    vim.fn.setreg('"', encoded_text)
end

k("v", "<leader>yu:", ":lua EncodeURL()<CR>", opt)
