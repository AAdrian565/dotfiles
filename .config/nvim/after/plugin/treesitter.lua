local languages = {
	"c",
	"html",
	"javascript",
	"lua",
	"markdown",
	"markdown_inline",
	"regex",
	"typescript",
	"vim",
	"vue",
}

require("nvim-treesitter").install(languages)

vim.api.nvim_create_autocmd("FileType", {
	pattern = languages,
	callback = function()
		vim.treesitter.start()
	end,
})

require("nvim-ts-autotag").setup({
	opts = {
		enable_close = true,
		enable_rename = true,
		enable_close_on_slash = false,
	},
	per_filetype = {
		html = { enable_close = true },
		xml = { enable_close = true },
		php = { enable_close = true },
		jsx = { enable_close = true },
	},
})

require("nvim-treesitter-textobjects").setup({
	select = { lookahead = true },
	move = { set_jumps = true },
})

local select = require("nvim-treesitter-textobjects.select").select_textobject
vim.keymap.set({ "x", "o" }, "af", function() select("@function.outer", "textobjects") end)
vim.keymap.set({ "x", "o" }, "if", function() select("@function.inner", "textobjects") end)
vim.keymap.set({ "x", "o" }, "ac", function() select("@class.outer", "textobjects") end)
vim.keymap.set({ "x", "o" }, "ic", function() select("@class.inner", "textobjects") end)

local move = require("nvim-treesitter-textobjects.move")
vim.keymap.set({ "n", "x", "o" }, "]f", function() move.goto_next_start("@function.outer", "textobjects") end)
vim.keymap.set({ "n", "x", "o" }, "]c", function() move.goto_next_start("@class.outer", "textobjects") end)
vim.keymap.set({ "n", "x", "o" }, "[f", function() move.goto_previous_start("@function.outer", "textobjects") end)
vim.keymap.set({ "n", "x", "o" }, "[c", function() move.goto_previous_start("@class.outer", "textobjects") end)
