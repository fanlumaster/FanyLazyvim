local map = vim.keymap.set
-- TODO: 不知道为什么 <leader>w 和 <leader>c 无法在 which-key 中显示
-- 添加 <leader>w 来保存当前buffer 的映射
map("n", "<leader>w", "<cmd>w<cr>", { desc = "Save" })
if not vim.g.vscode then
  -- quit current window
  map("n", "<leader><leader>q", "<cmd>q<cr>", { desc = "Save" })
  -- close current buffer
  map("n", "<leader>c", function()
    local bd = require("mini.bufremove").delete
    if vim.bo.modified then
      local choice = vim.fn.confirm(("Save changes to %q?"):format(vim.fn.bufname()), "&Yes\n&No\n&Cancel")
      if choice == 1 then -- Yes
        vim.cmd.write()
        bd(0)
      elseif choice == 2 then -- No
        bd(0, true)
      end
    else
      bd(0)
    end
  end, { noremap = true, desc = "Delete Buffer" })

  -- copy relative path
  vim.cmd([[
command! -nargs=0 CpRelativePath lua require("fany.utils.fanyutils").copy_relative_path()
]])

  -- copy relative path
  vim.cmd([[
command! -nargs=0 CpFileName lua require("fany.utils.fanyutils").copy_current_filename()
]])

  -- copy absolute path
  vim.cmd([[
command! -nargs=0 CpAbsolutePath lua require("fany.utils.fanyutils").copy_absolute_path()
]])

  -- register F11 to toggle fullscreen in normal mode
  if vim.g.neovide == true then
    vim.api.nvim_set_keymap("n", "<F11>", ":let g:neovide_fullscreen = !g:neovide_fullscreen<CR>", {})
  end
else
  map("n", "<leader><leader>q", "<Cmd>lua require('vscode').call('workbench.action.closeWindow')<CR>", { desc = "Quit VSCode" })
  map("n", "<leader>c", "<Cmd>lua require('vscode').call('workbench.action.closeEditorInAllGroups')<CR>", { desc = "Close Current Tab" })
  map("n", "<leader>e", "<Cmd>lua require('vscode').call('workbench.action.toggleSidebarVisibility')<CR>", { desc = "toggleSidebarVisibility" })
  map("n", "<leader>a", "<Cmd>lua require('vscode').call('workbench.action.toggleActivityBarVisibility')<CR>", { desc = "toggleActivityBarVisibility" })
end
