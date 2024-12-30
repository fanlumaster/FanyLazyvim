require("neo-tree").setup({
  window = {
    mappings = {
      ["zz"] = function()
        vim.cmd("normal! zz")
      end,
      ["zt"] = function()
        vim.cmd("normal! zt")
      end,
      ["zb"] = function()
        vim.cmd("normal! zb")
      end,
    },
  },
})
