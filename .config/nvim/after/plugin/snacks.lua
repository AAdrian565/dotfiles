local ok, snacks = pcall(require, "snacks")
if not ok then
	return
end

snacks.setup({
	bigfile = { enabled = true },
	dashboard = { enabled = false }, -- Using alpha-nvim
	indent = { enabled = false }, -- Using indent-blankline
	input = { enabled = true },
	notifier = { enabled = true },
	quickfile = { enabled = true },
	scroll = { enabled = true },
	statuscolumn = { enabled = true },
	words = { enabled = false },
	picker = {
		enabled = true,
		ui_select = true, -- overrides vim.ui.select (e.g. code actions)
	},
})

-- Keymaps
local k = vim.keymap.set
k("n", "<leader>nh", function() snacks.notifier.show_history() end, { desc = "Notification History" })
k("n", "<leader>nd", function() snacks.notifier.dismiss() end, { desc = "Dismiss All Notifications" })

-- Diagnostics & LSP Lists (Replacing Trouble)
k("n", "<leader>xx", function() snacks.picker.diagnostics() end, { desc = "Diagnostics (Snacks)" })
k("n", "<leader>xX", function() snacks.picker.diagnostics_buffer() end, { desc = "Buffer Diagnostics (Snacks)" })
k("n", "<leader>cs", function() snacks.picker.lsp_symbols() end, { desc = "Symbols (Snacks)" })
k("n", "<leader>cl", function() snacks.picker.lsp_references() end, { desc = "LSP References (Snacks)" })
k("n", "<leader>xL", function() snacks.picker.loclist() end, { desc = "Location List (Snacks)" })
k("n", "<leader>xQ", function() snacks.picker.qflist() end, { desc = "Quickfix List (Snacks)" })
