return {
  "catppuccin/nvim",
  lazy = true,
  name = "catppuccin",
  opts = {
    term_colors = true,
    custom_highlights = function()
      return {
        RainbowRed = { fg = "#E06C75" },
        RainbowYellow = { fg = "#E5C07B" },
        RainbowBlue = { fg = "#61AFEF" },
        RainbowOrange = { fg = "#D19A66" },
        RainbowGreen = { fg = "#98C379" },
        RainbowViolet = { fg = "#C678DD" },
        RainbowCyan = { fg = "#56B6C2" },
      }
    end,
    integrations = {
      aerial = true,
      alpha = true,
      cmp = true,
      dashboard = true,
      flash = true,
      fzf = true,
      grug_far = true,
      gitsigns = true,
      headlines = true,
      illuminate = true,
      indent_blankline = { enabled = true },
      leap = true,
      lsp_trouble = true,
      mason = true,
      markdown = true,
      mini = true,
      native_lsp = {
        enabled = true,
        underlines = {
          errors = { "undercurl" },
          hints = { "undercurl" },
          warnings = { "undercurl" },
          information = { "undercurl" },
        },
      },
      navic = { enabled = true, custom_bg = "lualine" },
      neotest = true,
      neotree = true,
      noice = true,
      notify = true,
      semantic_tokens = true,
      snacks = true,
      telescope = true,
      treesitter = true,
      treesitter_context = true,
      which_key = true,
    },
  },
  specs = {
    {
      "akinsho/bufferline.nvim",
      optional = true,
      opts = function(_, opts)
        if (vim.g.colors_name or ""):find("catppuccin") then
          opts.highlights = require("catppuccin.groups.integrations.bufferline").get()
        end
      end,
    },
  },
}
