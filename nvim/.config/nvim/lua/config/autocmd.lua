-- auto resize splits when the terminal's window is resized
vim.api.nvim_create_autocmd("VimResized", {
	command = "wincmd =",
})

-- no auto continue comments on new line
vim.api.nvim_create_autocmd("FileType", {
	group = vim.api.nvim_create_augroup("no_auto_comment", {}),
	callback = function()
		vim.opt_local.formatoptions:remove({ "c", "r", "o" })
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = "*",
	callback = function(args)
		local buffer = args.buf
		if vim.bo[buffer].buftype ~= "" then
			return
		end

		local ft = vim.bo[buffer].filetype
		local lang = vim.treesitter.language.get_lang(ft)
		if lang ~= "toggleterm" then
			vim.treesitter.start(args.buf, lang)
		end
	end,
})
