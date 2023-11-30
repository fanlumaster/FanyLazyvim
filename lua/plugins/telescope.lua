return {
  "nvim-telescope/telescope.nvim",
  keys = {
    -- disable the default keymap to search files
    { "<leader><space>", false },
    -- disable the keymap to grep file
    { "<leader>/", false },
    -- change a keymap
    {
      "<leader>ff",
      function()
        require("telescope.builtin").find_files()
      end,
      desc = "Find files",
    },
    {
      "<leader>fF",
      function()
        require("telescope.builtin").find_files({ hidden = true, no_ignore = true })
      end,
      desc = "Find all files",
    },
    {
      "<leader>fw",
      function()
        require("telescope.builtin").live_grep()
      end,
      desc = "Find words",
    },
    {
      "<leader>fW",
      function()
        require("telescope.builtin").live_grep({
          additional_args = function(args)
            return vim.list_extend(args, { "--hidden", "--no-ignore" })
          end,
        })
      end,
      desc = "Find words",
    },
    {
      "<leader>fc",
      function()
        require("telescope.builtin").commands()
      end,
      desc = "Find commands",
    },
    {
      "<leader>fC",
      function()
        require("telescope.builtin").grep_string()
      end,
      desc = "Find word under cursor",
    },
    {
      "<leader>fb",
      function()
        require("telescope.builtin").buffers()
      end,
      desc = "Find buffers",
    },
    -- add a keymap to browse plugin files
    { "<leader>fp", false },
  },
}
