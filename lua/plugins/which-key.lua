return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts_extend = { "spec" },
  opts = {
    defaults = {},
    spec = {
      {
        mode = { "n", "v" },
        { "<leader>c", desc = "Close current Buffer" },
        {
          "<leader>w",
          desc = "Save current file",
        },
      },
      { "<leader>wm", hidden = true },
    },
  },
  config = function(_, opts)
    local wk = require("which-key")
    wk.setup(opts)
  end,
}
