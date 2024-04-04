-- copy current relative path
vim.cmd([[
command! -nargs=0 CpRelativePath lua require("fany.utils.fanyutils").copy_relative_path()
]])

-- copy current filename only
vim.cmd([[
command! -nargs=0 CpFileName lua require("fany.utils.fanyutils").copy_current_filename()
]])

-- copy current absolute path
vim.cmd([[
command! -nargs=0 CpAbsolutePath lua require("fany.utils.fanyutils").copy_absolute_path()
]])
