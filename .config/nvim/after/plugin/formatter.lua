require("conform").setup({
	formatters_by_ft = {
		lua = { "stylua" },
		python = { "ruff_organize_imports", "ruff_format" },
		rust = { "rustfmt", lsp_format = "fallback" },
		javascript = { "prettierd", "prettier", stop_after_first = true },
		typescript = { "prettierd", "prettier", stop_after_first = true },
		vue = { "prettierd" },
		go = { "goimports", "gofmt" },
		yaml = { "yamlfmt" },
		["yaml.docker-compose"] = { "yamlfmt" },
		dockercompose = { "yamlfmt" },
		json = { "prettierd", "prettier", stop_after_first = true },
		html = { "prettierd", "prettier", stop_after_first = true },
		css = { "prettierd", "prettier", stop_after_first = true },
		markdown = { "prettierd", "prettier", stop_after_first = true },
	},
	formatters = {
		yamlfmt = {
			prepend_args = { "-formatter", "indent=4,retain_line_breaks=true" },
		},
		stylua = {
			prepend_args = { "--indent-width", "4", "--indent-type", "Spaces" },
		},
		prettier = {
			prepend_args = { "--tab-width", "4" },
		},
		prettierd = {
			prepend_args = { "--tab-width", "4" },
		},
	},
})
