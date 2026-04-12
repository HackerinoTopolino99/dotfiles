vim.opt.isfname:append("@-@")

vim.opt.path:append({
  "./../templates",
  "./../files",
  "templates",
  "files"
})

vim.opt_local.commentstring = "# %s"
vim.opt_local.shiftwidth = 2
