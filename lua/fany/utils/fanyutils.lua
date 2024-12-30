local myutils = {}

-- 获取当前文件的相对路径
-- 有利于在 cmake 中便捷地去修改要编译的单文件
function myutils.copy_relative_path()
  local current_file = vim.fn.expand("%")
  local relative_path = vim.fn.fnamemodify(current_file, ":~:.")
  local clipboard_content = relative_path
  clipboard_content = ".\\" .. clipboard_content
  clipboard_content = string.gsub(clipboard_content, "\\", "/") -- 把默认的 \ 分隔符换成 /
  vim.fn.setreg("+", clipboard_content)
end

-- copy 当前的文件名，不带后缀
function myutils.copy_current_filename()
  local current_file = vim.fn.expand("%:t") -- 仅获取当前文件的文件名部分，不包含前面的路径
  local clipboard_content = current_file
  clipboard_content = string.gsub(clipboard_content, "%..+", "")
  vim.fn.setreg("+", clipboard_content)
end

-- 获取当前文件的绝对路径
-- 有利于在 cmake 中便捷地去修改要编译的单文件
function myutils.copy_absolute_path()
  local current_file = vim.fn.expand("%:p")
  local clipboard_content = string.gsub(current_file, "\\", "/") -- 把默认的 \ 分隔符换成 /
  vim.fn.setreg("+", clipboard_content)
end

function myutils.set_os_info()
  if vim.fn.exists('g:os') == 0 then
      local is_windows = vim.fn.has("win64") == 1 or vim.fn.has("win32") == 1 or vim.fn.has("win16") == 1
      if is_windows then
          vim.g.os = "Windows"
      else
          local uname_output = vim.fn.system('uname')
          vim.g.os = string.gsub(uname_output, '\n', '')
      end
  end
end

return myutils
