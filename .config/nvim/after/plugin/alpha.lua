local ok, alpha = pcall(require, "alpha")
if not ok then
	return
end

local dashboard = require("alpha.themes.dashboard")

local ascii_art = {
	"                                        ",
	" ████     ██ ██      ██ ██ ████     ████",
	"░██░██   ░██░██     ░██░██░██░██   ██░██",
	"░██░░██  ░██░██     ░██░██░██░░██ ██ ░██",
	"░██ ░░██ ░██░░██    ██ ░██░██ ░░███  ░██",
	"░██  ░░██░██ ░░██  ██  ░██░██  ░░█   ░██",
	"░██   ░░████  ░░████   ░██░██   ░    ░██",
	"░██    ░░███   ░░██    ░██░██        ░██",
	"░░      ░░░     ░░     ░░ ░░         ░░",
}

local win_height = vim.fn.winheight(0)
local art_height = #ascii_art
local pad_lines = math.floor((win_height - art_height) / 2)

local padded_header = {}
for _ = 1, pad_lines do
	table.insert(padded_header, "")
end
vim.list_extend(padded_header, ascii_art)

dashboard.section.header.val = padded_header
dashboard.section.header.opts = {
	position = "center",
	hl = "String", -- use any highlight group
}

dashboard.section.buttons.val = {}
dashboard.section.footer.val = {}

alpha.setup(dashboard.opts)
