return {
  "kylechui/nvim-surround",
  version = "*", -- Use for stability; omit to use `main` branch for the latest features
  event = "VeryLazy",
  config = function()
    require("nvim-surround").setup({
      keymaps = {},
      surrounds = {},
      aliases = {},
      highlight = {},
      move_cursor = "begin",
      indent_lines = function(start, stop)
        local b = vim.bo
        -- Only re-indent the selection if a formatter is set up already
        if start < stop and (b.equalprg ~= "" or b.indentexpr ~= "" or b.cindent or b.smartindent or b.lisp) then
          vim.cmd(string.format("silent normal! %dG=%dG", start, stop))
        end
      end,
    })
  end,
}
