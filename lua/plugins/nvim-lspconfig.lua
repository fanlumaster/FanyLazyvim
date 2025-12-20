return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      ["*"] = {
        -- disable some keymaps
        keys = {
          { "<leader>ca", false },
          { "<leader>cc", false },
          { "<leader>cC", false },
          { "<leader>cR", false },
          { "<leader>cr", false },
          { "<leader>cA", false },
          { "<leader>cl", false },
          { "<leader>cs", false },
          { "<leader>cS", false },
        },
      },

      -- Ensure mason installs the server
      clangd = {
        keys = {
          { "<leader>cR", false },
        },
      },
    },
  },
}
