return {
  { "shaunsingh/oxocarbon.nvim" },
  { "ellisonleao/gruvbox.nvim" },
  { "rose-pine/neovim", name = "rose-pine" },
  {
    "tokyonight.nvim",
    priority = 1000,
    opts = function()
      return {
        -- style = "moon",
        -- transparent = true,
        styles = {
          -- sidebars = "transparent",
          -- floats = "transparent",
          comments = { italic = false },
          keywords = { italic = false },
          functions = { italic = false },
          variables = { italic = false },
        },
      }
    end,
  },
}
