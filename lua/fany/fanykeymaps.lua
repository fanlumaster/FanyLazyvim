-- copy relative path
vim.cmd([[
command! -nargs=0 CpRelativePath lua require("fany.utils.fanyutils").copy_relative_path()
]])
-- copy relative path
vim.cmd([[
command! -nargs=0 CpFileName lua require("fany.utils.fanyutils").copy_current_filename()
]])
