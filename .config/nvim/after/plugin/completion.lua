require("blink.cmp").setup({
	keymap = {
		preset = "default",
		-- These are installed explicitly below so they work even if Blink's
		-- InsertEnter keymap setup runs after the first insert-mode entry.
		["<C-k>"] = false,
		["<C-j>"] = false,
		["<C-l>"] = false,
		["<C-space>"] = {
			function(cmp)
				cmp.show({ providers = { "snippets" } })
			end,
		},
	},
	appearance = {
		nerd_font_variant = "mono",
	},
	completion = {
		documentation = {
			auto_show = true,
			auto_show_delay_ms = 500,
		},
	},
	sources = {
		default = { "lsp", "path", "snippets", "lazydev" },
		providers = {
			lazydev = {
				module = "lazydev.integrations.blink",
				score_offset = 100,
			},
		},
	},
	snippets = {
		preset = "luasnip",
	},
	fuzzy = {
		implementation = "rust",
	},
	signature = {
		enabled = true,
	},
})

local completion_actions = {
	["<C-j>"] = "select_next",
	["<C-k>"] = "select_prev",
	["<C-l>"] = "select_and_accept",
}

for key, action in pairs(completion_actions) do
	vim.keymap.set("i", key, function()
		local cmp = require("blink.cmp")
		if cmp[action]() then return "" end
		return vim.api.nvim_replace_termcodes(key, true, false, true)
	end, {
		expr = true,
		noremap = true,
		silent = true,
		replace_keycodes = false,
		desc = "Completion: " .. action,
	})
end

local ok_luasnip, luasnip = pcall(require, "luasnip")
if ok_luasnip then
	require("luasnip.loaders.from_vscode").lazy_load()
end
