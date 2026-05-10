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
			pcall(vim.treesitter.start, args.buf, lang)
		end
	end,
})

local augroup = vim.api.nvim_create_augroup('VisualComment', { clear = true })

local function set_comment_char(char)
  vim.keymap.set('v', '<leader>c', ':norm I' .. char .. ' <CR>', { buffer = true })
end

-- Linguaggi che usano #
vim.api.nvim_create_autocmd('FileType', {
  group = augroup,
  pattern = { 'python', 'sh', 'yaml', 'ruby', 'yaml.ansible' , 'hyprlang'},
  callback = function() set_comment_char('#') end,
})

-- Linguaggi che usano //
vim.api.nvim_create_autocmd('FileType', {
  group = augroup,
  pattern = { 'c', 'cpp', 'java', 'javascript', 'typescript' },
  callback = function() set_comment_char('//') end,
})

-- Linguaggi che usano --
vim.api.nvim_create_autocmd('FileType', {
  group = augroup,
  pattern = { 'lua', 'sql' },
  callback = function() set_comment_char('--') end,
})
