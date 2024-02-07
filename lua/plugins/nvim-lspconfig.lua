return {
  "neovim/nvim-lspconfig",
  init = function()
    local keys = require("lazyvim.plugins.lsp.keymaps").get()
    -- disable a keymap
    keys[#keys + 1] = { "<leader>ca", false }
    keys[#keys + 1] = { "<leader>cA", false }
    keys[#keys + 1] = { "<leader>cl", false }
    keys[#keys + 1] = { "<leader>cr", false }
  end,
  opts = {
    servers = {
      -- Ensure mason installs the server
      clangd = {
        keys = {
          { "<leader>cR", false },
        },
      },
    },
  },
}
