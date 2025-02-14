-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local map = vim.keymap.set
local unmap = vim.keymap.del
local Util = require("lazyvim.util")

-- map some basic shortcuts
map("n", "<leader><leader>q", "<cmd>q<cr>", { desc = "Quit Current Window" })

-- 去掉 <leader><leader> 来搜索文件的映射，转移到 lazy.lua 中去去除
-- unmap("n", "<leader><space>", { desc = "Find Files (root dir)" })
-- remove the mapping of <leader>w
unmap("n", "<leader>w", { desc = "Windows" }) -- This is optional, does not has the real effect, the effective code is located in which-key.lua file
unmap("n", "<leader>wd", { desc = "Windows" })
unmap("n", "<leader>wm", { desc = "Enable Maximize" })
map("n", "<leader>w", "<cmd>w<cr>", { desc = "Save current change", remap = true })

unmap("n", "<leader>l", { desc = "Lazy" })

-- toggle color between 雷姆蓝 and 拉姆粉
local color_switch = 1
local function toggle_color()
  if color_switch == 1 then
    color_switch = 0
    vim.cmd("highlight Cursor gui=NONE guifg=bg guibg=#ffb6c1")
  else
    color_switch = 1
    vim.cmd("highlight Cursor gui=NONE guifg=bg guibg=#91bef0")
  end
end
map("n", "<leader><leader>t", function()
  toggle_color()
end, { desc = "Toggle gui cursor color" })

-- for hop.nvim
local hop = require("hop")
local directions = require("hop.hint").HintDirection
local positions = require("hop.hint").HintPosition
-- leader leader w
map({ "n", "v" }, "<leader><leader>w", function()
  hop.hint_words({ direction = directions.AFTER_CURSOR })
end, { desc = "Go to next any begining of words" })
-- leader leader e
map({ "n", "v" }, "<leader><leader>e", function()
  hop.hint_words({ direction = directions.AFTER_CURSOR, hint_position = positions.END })
end, { desc = "Go to next any end of words" })
-- leader leader b
map({ "n", "v" }, "<leader><leader>b", function()
  hop.hint_words({ direction = directions.BEFORE_CURSOR })
end, { desc = "Go to previous any begining of words" })
-- leader leader b
map({ "n", "v" }, "<leader><leader>v", function()
  hop.hint_words({ direction = directions.BEFORE_CURSOR, hint_position = positions.END })
end, { desc = "Go to previous any end of words" })
-- leader leader l
map({ "n", "v" }, "<leader><leader>l", function()
  hop.hint_camel_case({ direction = directions.AFTER_CURSOR })
end, { desc = "Go to next any begining of words" })
-- leader leader h
map({ "n", "v" }, "<leader><leader>h", function()
  hop.hint_camel_case({ direction = directions.BEFORE_CURSOR })
end, { desc = "Go to previous any begining of words" })

-- leader leader f
map({ "n", "v" }, "<leader><leader>h", function()
  hop.hint_camel_case({ direction = directions.BEFORE_CURSOR })
end, { desc = "Go to previous any begining of words" })

-- suppress useless warning here
---@diagnostic disable: missing-fields
-- leader leader a
map({ "n", "v" }, "<leader><leader>a", function()
  hop.hint_anywhere({})
end, { desc = "Go to any char" })
---@diagnostic enable: missing-fields

-- leader leader j
map({ "n", "v" }, "<leader><leader>j", function()
  hop.hint_lines({ direction = directions.AFTER_CURSOR })
end, { desc = "Go to line below" })
-- leader leader k
map({ "n", "v" }, "<leader><leader>k", function()
  hop.hint_lines({ direction = directions.BEFORE_CURSOR })
end, { desc = "Go to line above" })

map("n", "]t", "<cmd>tabnext<cr>", { desc = "Next Tab" })
map("n", "[t", "<cmd>tabprevious<cr>", { desc = "Previous Tab" })

map("n", "<leader>v", function()
  require("mini.bufremove").delete(0, true)
end, { desc = "Close current buffer" })

-- toggleterm
map("n", "<leader>th", "<cmd>ToggleTerm size=15 direction=horizontal<cr>", { desc = "ToggleTerm horizontal split" })
map("n", "<leader>tf", "<cmd>ToggleTerm direction=float<cr>", { desc = "ToggleTerm float" })
map("n", "<leader>tv", "<cmd>ToggleTerm size=80 direction=vertical<cr>", { desc = "ToggleTerm vertical split" })

-- programming language about
-- run single python codes
if not vim.g.vscode then
  map("n", "<leader>py", '<cmd>TermExec cmd="python %"<cr>', { desc = "Run python codes" })
  -- run rust binary project
  map("n", "<leader>ru", '<cmd>TermExec cmd="cargo run"<cr>', { desc = "Run rust project" })
end

-- 移动 buffer
local moveBy = function(dir)
  if dir == "left" then
    dir = -1
  else
    dir = 1
  end
  local moveBy = vim.v.count
  if moveBy == 0 then
    moveBy = 1
  end
  local myBufferline = require("bufferline")
  for _ = 1, moveBy, 1 do
    myBufferline.move(dir)
  end
end

vim.keymap.set("n", "<b", function()
  moveBy("left")
end, { desc = "Move current buffer to left" })
vim.keymap.set("n", ">b", function()
  moveBy("right")
end, { desc = "Move current buffer to right" })

-- for persisted
map("n", "<leader>fs", "<cmd>Telescope persisted<cr>", { desc = "Search history sessions" })

-- for cancel of highlight
map("n", "<leader>h", "<cmd>noh<cr>", { desc = "Cancel highlight" })

-- change filtetype between html and htmldjango
map("n", "<leader><leader>d", "<cmd>set filetype=htmldjango<cr>", { desc = "Cancel highlight" })

-- toggle current filetype between html and htmldjango, this is mainly used to toggle highlight of treesitter between html and htmldjango
local function toggle_between_html_and_dj()
  local bufnr = vim.api.nvim_get_current_buf()
  local filetype = vim.bo[bufnr].filetype
  if filetype == "html" then
    vim.cmd("set filetype=htmldjango")
  elseif filetype == "htmldjango" then
    vim.cmd("set filetype=html")
  end
end
-- map("n", "<leader><leader>t", function()
--   toggle_between_html_and_dj()
-- end, { desc = "Toggle html and htmldjango" })

-- lsp about
-- unmap("n", "<leader>cl") -- 这个在 nvim-lspconfig 插件配置中进行取消映射
-- unmap({ "n", "v" }, "<leader>ca", { desc = "Code Action" }) -- 这个在 nvim-lspconfig 插件配置中进行取消映射
-- unmap("n", "<leader>cA", { desc = "Source Action" }) -- 这个在 nvim-lspconfig 插件配置中进行取消映射
-- unmap("n", "<leader>cr") -- 这个在 nvim-lspconfig 插件配置中进行取消映射
-- unmap("n", "<leader>cm") -- 这个在 mason 插件配置中进行取消映射
-- unmap({ "n", "v" }, "<leader>cF") -- 这个在 conform 插件配置中进行取消映射

unmap("n", "<leader>cd")
unmap({ "n", "v" }, "<leader>cf")

map("n", "<leader>lA", function()
  vim.lsp.buf.code_action({
    context = {
      only = {
        "source",
      },
      diagnostics = {},
    },
  })
end, { desc = "Source Action" })

map({ "n", "v" }, "<leader>la", vim.lsp.buf.code_action, { desc = "Code Action" })

map("n", "<leader>ld", vim.diagnostic.open_float, { desc = "Line Diagnostics" })

-- formatting
if vim.g.vscode then
  map("n", "<leader>lf", "<Cmd>lua require('vscode').call('editor.action.formatDocument')<CR>", { desc = "Format" })
  map("v", "<leader>lf", "<Cmd>lua require('vscode').call('editor.action.formatSelection')<CR>", { desc = "Format" })
else
  map({ "n", "v" }, "<leader>lf", function()
    Util.format({ force = true })
  end, { desc = "Format" })
end

map({ "n", "v" }, "<leader>lF", function()
  require("conform").format({ formatters = { "injected" } })
end, { desc = "Format Injected Langs" })

map("n", "<leader>ll", "<cmd>LspInfo<cr>", { desc = "Lsp Info" })

map("n", "<leader>lm", "<cmd>Mason<cr>", { desc = "Mason" })
if require("lazyvim.util").has("inc-rename.nvim") then
  map("n", "<leader>lr", function()
    local inc_rename = require("inc_rename")
    return ":" .. inc_rename.config.cmd_name .. " " .. vim.fn.expand("<cword>")
  end, { desc = "Rename" })
else
  map("n", "<leader>lr", vim.lsp.buf.rename, { desc = "Rename" })
end

-- 解决 visual 选中粘贴替换只能粘贴一次的问题
map("x", "p", "P")

map({ "i" }, "<Esc-j>", "<Esc-Esc-j>")
map({ "i" }, "<Esc-k>", "<Esc-Esc-k>")

-- TODO: 目前无法规避这个问题：1、在 Windows Terminal 中同时按下 Esc + j/k 会等效于 Alt + j/k，这样就会触发 Alt + j/k 绑定的 swap lines 的功能；2、而在 Neovide 中，在 Windows 下，其无法响应 Ctrl + Alt + j/k 的快捷键，那么，只能采取以下折中的方法暂时规避。按：在 Arch + KDE(wayland) 中这些都是正常的
if not vim.g.neovide then
  -- unmap for moving lines
  unmap({ "n", "i" }, "<A-j>")
  unmap({ "n", "i" }, "<A-k>")

  -- remap for moving lines
  map("n", "<C-A-j>", "<cmd>m .+1<cr>==", { desc = "Move Down" })
  map("n", "<C-A-k>", "<cmd>m .-2<cr>==", { desc = "Move Up" })
  map("i", "<C-A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move Down" })
  map("i", "<C-A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move Up" })
  map("v", "<C-A-j>", ":m '>+1<cr>gv=gv", { desc = "Move Down" })
  map("v", "<C-A-k>", ":m '<-2<cr>gv=gv", { desc = "Move Up" })
end
