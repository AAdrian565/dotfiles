local ok_comment, comment = pcall(require, "Comment")
if not ok_comment then
	return
end

local ok_ts, ts_integration = pcall(require, "ts_context_commentstring.integrations.comment_nvim")
if not ok_ts then
	return
end

vim.g.skip_ts_context_commentstring_module = true

comment.setup({
	pre_hook = ts_integration.create_pre_hook(),
})

local ok_tsconfig, ts_context = pcall(require, "ts_context_commentstring")
if ok_tsconfig then
	ts_context.setup({
		enable_autocmd = false,
	})
end
