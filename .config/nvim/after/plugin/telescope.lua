local file_ignore_patterns = {
	"node_modules/*",
	"^%.svelte%-kit/*",
	"^%.cache/*",
	"^%.git/.*",
	"build/.*",
	"fonts/.*",
	"[Rr]unner/.*",
	"[Rr]unner.xcodeproj/.*",
	"[Rr]unner.xcworkspace/.*",
	".*%.o$",
	".*%.bin$",
	".*%.png$",
	".*%.jpg$",
	".*%.lock$",
	".*%-lock.json$",
	"venv/.*",
	".*_templ.go$",
}

require("telescope").setup({
	defaults = {
		vimgrep_arguments = {
			"rg",
			"--color=never",
			"--no-heading",
			"--with-filename",
			"--line-number",
			"--column",
			"--smart-case",
			"--hidden",
			"--glob",
			"!**/.git/*",
		},
		file_ignore_patterns = file_ignore_patterns,
		mappings = {
			n = {
				["g?"] = "which_key",
			},
		},
	},
})

require("telescope").load_extension("live_grep_args")

local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>pf", ":Telescope find_files find_command=rg,--ignore,--hidden,--files<cr>", {})
vim.keymap.set("n", "<C-p>", builtin.git_files, {})
vim.keymap.set("n", "<leader>ps", function()
	require("telescope").extensions.live_grep_args.live_grep_args({
		file_ignore_patterns = file_ignore_patterns,
	})
end, { desc = "Telescope Live Grep with Args" })
