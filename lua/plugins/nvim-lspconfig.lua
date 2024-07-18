return {
  "neovim/nvim-lspconfig",
  init = function()
    local keys = require("lazyvim.plugins.lsp.keymaps").get()
    -- disable a keymap
    keys[#keys + 1] = { "<leader>ca", false }
    keys[#keys + 1] = { "<leader>cc", false }
    keys[#keys + 1] = { "<leader>cC", false }
    keys[#keys + 1] = { "<leader>cR", false }
    keys[#keys + 1] = { "<leader>cr", false }
    keys[#keys + 1] = { "<leader>cA", false }
    keys[#keys + 1] = { "<leader>cl", false }
    keys[#keys + 1] = { "<leader>cs", false }
    keys[#keys + 1] = { "<leader>cS", false }
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
