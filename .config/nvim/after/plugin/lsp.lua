vim.api.nvim_create_autocmd("lspattach", {
	group = vim.api.nvim_create_augroup("lsp-attach", { clear = true }),
	callback = function(event)
		local map = function(keys, func, desc, mode)
			mode = mode or "n"
			vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
		end
		map("<S-k>", vim.lsp.buf.hover, "Hover Documentation")
		map("grn", vim.lsp.buf.rename, "[R]e[n]ame")
		map("gra", vim.lsp.buf.code_action, "[G]oto Code [A]ction", { "n", "x" })
		map("grr", require("telescope.builtin").lsp_references, "[G]oto [R]eferences")
		map("gri", require("telescope.builtin").lsp_implementations, "[G]oto [I]mplementation")
		map("grd", require("telescope.builtin").lsp_definitions, "[G]oto [D]efinition")
		map("grD", vim.lsp.buf.declaration, "[G]oto [D]eclaration")
		map("gO", require("telescope.builtin").lsp_document_symbols, "Open Document Symbols")
		map("gW", require("telescope.builtin").lsp_dynamic_workspace_symbols, "Open Workspace Symbols")
		map("grt", require("telescope.builtin").lsp_type_definitions, "[G]oto [T]ype Definition")
		map("<leader>q", vim.diagnostic.setloclist, "Set Location List")
		local function client_supports_method(client, method, bufnr)
			if vim.fn.has("nvim-0.11") == 1 then
				return client:supports_method(method, bufnr)
			else
				return client.supports_method(method, { bufnr = bufnr })
			end
		end
		local client = vim.lsp.get_client_by_id(event.data.client_id)
		if client and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_inlayHint, event.buf) then
			map("<leader>th", function()
				vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({ bufnr = event.buf }))
			end, "[T]oggle Inlay [H]ints")
		end
	end,
})
vim.diagnostic.config({
	severity_sort = true,
	float = { border = "rounded", source = "if_many" },
	underline = { severity = vim.diagnostic.severity.ERROR },
	signs = vim.g.have_nerd_font and {
		text = {
			[vim.diagnostic.severity.ERROR] = "󰅚 ",
			[vim.diagnostic.severity.WARN] = "󰀪 ",
			[vim.diagnostic.severity.INFO] = "󰋽 ",
			[vim.diagnostic.severity.HINT] = "󰌶 ",
		},
	} or {},
	virtual_text = {
		source = "if_many",
		spacing = 2,
		format = function(diagnostic)
			local diagnostic_message = {
				[vim.diagnostic.severity.ERROR] = diagnostic.message,
				[vim.diagnostic.severity.WARN] = diagnostic.message,
				[vim.diagnostic.severity.INFO] = diagnostic.message,
				[vim.diagnostic.severity.HINT] = diagnostic.message,
			}
			return diagnostic_message[diagnostic.severity]
		end,
	},
})

local capabilities = require("blink.cmp").get_lsp_capabilities()
local servers = {
	lua_ls = {
		settings = {
			Lua = {
				completion = {
					callSnippet = "Replace",
				},
			},
		},
	},
	pyright = {},
}

local ensure_installed = vim.tbl_keys(servers or {})
vim.list_extend(ensure_installed, {
	"stylua",
	"gopls",
	"black",
	"isort",
	"eslint_d",
	"prettierd",
	"pyright",
	"emmet-language-server",
})
require("mason-tool-installer").setup({ ensure_installed = ensure_installed })
vim.api.nvim_create_autocmd("BufWritePre", {
	pattern = { "*.go", "*.py" },
	callback = function()
		local params = vim.lsp.util.make_range_params()
		params.context = { only = { "source.organizeImports" } }

		local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, 1000)
		for _, res in pairs(result or {}) do
			for _, r in pairs(res.result or {}) do
				if r.edit then
					vim.lsp.util.apply_workspace_edit(r.edit, "utf-16")
				elseif r.command then
					vim.lsp.buf.execute_command(r.command)
				end
			end
		end
		vim.lsp.buf.format({ async = false })
	end,
})
require("mason-lspconfig").setup({
	ensure_installed = {},
	automatic_installation = false,
	handlers = {
		function(server_name)
			local server = servers[server_name] or {}
			server.capabilities = vim.tbl_deep_extend("force", {}, capabilities, server.capabilities or {})
			require("lspconfig")[server_name].setup(server)
		end,
	},
})
