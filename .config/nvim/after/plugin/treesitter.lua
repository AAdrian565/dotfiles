require("nvim-treesitter.configs").setup({
	ensure_installed = { "javascript", "typescript", "c", "lua", "vim", "vue" },
	autotag = {
		enable = true,
		filetypes = { "html", "xml", "php", "jsx" },
	},
	sync_install = true,
	auto_install = true,
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
})
vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
	underline = true,
	virtual_text = {
		spacing = 5,
		severity_limit = "Warning",
	},
	update_in_insert = true,
})
