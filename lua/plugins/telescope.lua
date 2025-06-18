return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  keys = {
    -- add a keymap to browse plugin files
    -- stylua: ignore
    {
      "<leader>ff",
      function()
        require("telescope.builtin").find_files({ cwd = require("lazy.core.config").options.root })
      end,
      desc = "Telescope: Find file",
    },
    {
      "<leader>fg",
      function()
        require("telescope.builtin").live_grep()
      end,
      desc = "Telescope: Live Grep",
    },
    {
      "<leader>ws",
      function()
        local word = vim.fn.expand("<cword>")
        require("telescope.builtin").grep_string({ search = word })
      end,
      -- TODO Add desc
    },
    {
      "<leader>Ws",
      function()
        local word = vim.fn.expand("<cWORD>")
        require("telescope.builtin").grep_string({ search = word })
      end,
      -- TODO Add desc
    },
  },
  opts = {
    defaults = {
      layout_strategy = "horizontal",
      layout_config = { prompt_position = "top" },
      sorting_strategy = "ascending",
      winblend = 0,
    },
  },
}
