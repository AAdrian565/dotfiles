if vim.islist then
	vim.tbl_islist = vim.islist
end

require("config.set")
require("config.lazy")
require("config.function")
require("config.keymap")
