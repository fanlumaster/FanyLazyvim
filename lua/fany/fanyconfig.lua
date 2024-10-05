if vim.g.neovide then
  vim.cmd.colorscheme("catppuccin")
end

-- 设置 visual 模式下选中的背景高亮色
vim.cmd("highlight Visual guibg=#135564")

-- 设置光标的颜色默认为拉姆的发(fà)色
vim.cmd("highlight Cursor gui=NONE guifg=bg guibg=#ffb6c1")

-- hop
-- 设置单字符高亮的颜色为 notion 中的暗色模式下的砖红色
vim.api.nvim_command("highlight HopNextKey guifg=#FF7369 guibg=none gui=none ctermfg=none cterm=bold")

-- 解决 python 在定义函数参数时按下 : 会自动缩进的问题
vim.api.nvim_command("set indentkeys-=<:>")
