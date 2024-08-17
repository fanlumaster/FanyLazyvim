return {
  "folke/tokyonight.nvim",
  lazy = true,
  opts = function()
    local is_transparent = false
    if not vim.g.neovide == true then
      is_transparent = true
    end
    return {
      style = "night",
      transparent = is_transparent,
      styles = {
        floats = "transparent",
        sidebars = "transparent",
        comments = { italic = false },
        keywords = { italic = false },
        functions = { italic = false },
        variables = { italic = false },
      },
    }
  end,
}
