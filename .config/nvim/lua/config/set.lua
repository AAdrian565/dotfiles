local o = vim.opt
o.guicursor = ""

o.nu = true
o.relativenumber = true
o.splitbelow = true
o.splitright = true
o.inccommand = "split"

o.inccommand = "split"

o.virtualedit = "block"

o.tabstop = 4
o.softtabstop = 4
o.shiftwidth = 4
o.expandtab = true

o.smartindent = true

o.wrap = false

o.swapfile = false
o.backup = false
o.undodir = os.getenv("HOME") .. "/.vim/undodir"
o.undofile = true

o.hlsearch = false
o.incsearch = true

o.termguicolors = true

o.scrolloff = 8
o.signcolumn = "yes"
o.isfname:append("@-@")

o.updatetime = 50

o.list = true

o.listchars = {
	tab = "  ",
	trail = "·",
	extends = "»",
	precedes = "«",
	nbsp = "␣",
}
