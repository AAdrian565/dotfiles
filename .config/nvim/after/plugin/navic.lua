local ok, navic = pcall(require, "nvim-navic")
if not ok then
	return
end

navic.setup({
	lsp = {
		auto_attach = true,
	},
})
