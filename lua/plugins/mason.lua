return {
  "williamboman/mason.nvim",
  keys = {
    { "<leader>cm", false },
  },
  opts = {
    ensure_installed = {
      "html-lsp",
      "prettier",
      "pyright",
      "autopep8",
    },
  },
}
