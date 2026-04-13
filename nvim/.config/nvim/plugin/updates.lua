local function auto_update_plugins(days)
  local pack_log_file = vim.fn.stdpath("log") .. "/nvim-pack.log"
  local last_modified_timestamp = vim.fn.getftime(pack_log_file)

  if os.time() > last_modified_timestamp + days*24*60*60 or last_modified_timestamp == -1 then
    vim.pack.update(nil, { force = true })
  end
end

auto_update_plugins(7)
