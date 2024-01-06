-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- copy relative path
vim.cmd([[
command! -nargs=0 CpRelativePath lua require("fany.fanyutils").copy_relative_path()
]])
-- copy relative path
vim.cmd([[
command! -nargs=0 CpFileName lua require("fany.fanyutils").copy_current_filename()
]])
