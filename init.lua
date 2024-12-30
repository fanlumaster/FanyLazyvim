-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

require("fany.fanykeymaps")
require("fany.fanyconfig")
if not vim.g.vscode then
  require("fany.fanytelescope")
  require("fany.fanyformat")
  require("fany.utils.fanyutils").set_os_info()
  require("fany.fanysnippets")
  require("fany.fanyneotree")
  require("fany.fanytoggleterm")
end
