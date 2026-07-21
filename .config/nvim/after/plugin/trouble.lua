local ok, trouble = pcall(require, "trouble")
if not ok then
	return
end

trouble.setup({})

local k = vim.keymap.set
local opt = { silent = true }

k("n", "<leader>xx", "<cmd>Trouble diagnostics toggle<cr>", vim.tbl_extend("force", opt, { desc = "Diagnostics (Trouble)" }))
k("n", "<leader>xX", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", vim.tbl_extend("force", opt, { desc = "Buffer Diagnostics (Trouble)" }))
k("n", "<leader>cs", "<cmd>Trouble symbols toggle focus=false win.position=right<cr>", vim.tbl_extend("force", opt, { desc = "Symbols (Trouble)" }))
k("n", "<leader>cl", "<cmd>Trouble lsp toggle focus=false win.position=right<cr>", vim.tbl_extend("force", opt, { desc = "LSP Definitions / references / ... (Trouble)" }))
k("n", "<leader>xL", "<cmd>Trouble loclist toggle<cr>", vim.tbl_extend("force", opt, { desc = "Location List (Trouble)" }))
k("n", "<leader>xQ", "<cmd>Trouble qflist toggle<cr>", vim.tbl_extend("force", opt, { desc = "Quickfix List (Trouble)" }))
