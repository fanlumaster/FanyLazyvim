-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here

local function augroup(name)
  return vim.api.nvim_create_augroup("lazyvim_" .. name, { clear = true })
end

-- wrap and check for spell in text filetypes
vim.api.nvim_create_autocmd("FileType", {
  group = augroup("wrap_spell"),
  pattern = { "gitcommit", "markdown" },
  callback = function()
    vim.opt_local.wrap = true
    vim.opt_local.spell = false -- 覆盖默认的 true
  end,
})

if not vim.g.vscode then
  -- vim.api.nvim_create_autocmd("FileType", {
  --   group = augroup("associate_filetype"),
  --   pattern = { "htmldjango" },
  --   callback = function()
  --     vim.api.nvim_command("set filetype=html")
  --   end,
  -- })

  vim.api.nvim_create_autocmd("FileType", {
    group = augroup("associate_filetype"),
    pattern = { "python" },
    callback = function()
      vim.opt.shiftwidth = 4
      vim.opt.formatoptions:remove({ "o" }) -- 防止使用 o 切换到下一行的时候自动加上注释符号(在上一行是注释的情况下)
    end,
  })

  vim.api.nvim_create_autocmd("FileType", {
    group = augroup("associate_filetype"),
    pattern = { "c", "cpp" },
    callback = function()
      vim.opt.shiftwidth = 2
      vim.opt.formatoptions:remove({ "o" }) -- 防止使用 o 切换到下一行的时候自动加上注释符号(在上一行是注释的情况下)
    end,
  })

  vim.api.nvim_create_autocmd("InsertLeave", {
    callback = function()
      if
          require("luasnip").session.current_nodes[vim.api.nvim_get_current_buf()]
          and not require("luasnip").session.jump_active
      then
        require("luasnip").unlink_current()
      end
    end,
  })

  -- make telescope preview show line numbers
  vim.api.nvim_create_autocmd("User", {
    pattern = "TelescopePreviewerLoaded",
    callback = function()
      vim.opt_local.number = true
    end,
  })
end
