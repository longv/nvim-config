return {
  "lewis6991/gitsigns.nvim",
  keys = {
    {
      "]c",
      function()
        if vim.wo.diff then
          vim.cmd.normal({ "]c", bang = true })
        else
          require("gitsigns").nav_hunk("next")
        end
      end,
    },
    {
      "[c",
      function()
        if vim.wo.diff then
          vim.cmd.normal({ "[c", bang = true })
        else
          require("gitsigns").nav_hunk("prev")
        end
      end,
    },
    -- Normal mode mappings
    {
      "<leader>gs",
      function()
        require("gitsigns").stage_hunk()
      end,
      desc = "Git: Stage Hunk",
    },
    {
      "<leader>gr",
      function()
        require("gitsigns").reset_hunk()
      end,
      desc = "Git: Reset Hunk",
    },
    {
      "<leader>gS",
      function()
        require("gitsigns").stage_buffer()
      end,
      desc = "Git: Stage Buffer",
    },
    {
      "<leader>gR",
      function()
        require("gitsigns").reset_buffer()
      end,
      desc = "Git: Reset Buffer",
    },
    {
      "<leader>gp",
      function()
        require("gitsigns").preview_hunk()
      end,
      desc = "Git: Preview Hunk",
    },
    {
      "<leader>gb",
      function()
        require("gitsigns").blame_line({ full = true })
      end,
      desc = "Git: Blame Line (Full)",
    },
    {
      "<leader>gb",
      function()
        require("gitsigns").toggle_current_line_blame()
      end,
      desc = "Git: Toggle Line Blame",
    },
    {
      "<leader>gd",
      function()
        require("gitsigns").diffthis()
      end,
      desc = "git: diff this",
    },
    {
      "<leader>gD",
      function()
        require("gitsigns").diffthis("~")
      end,
      desc = "Git: Diff With ~",
    },
    {
      "<leader>gd",
      function()
        require("gitsigns").preview_hunk_inline()
      end,
      desc = "Git: Toggle Deleted (Deprecated)",
    },

    -- Visual mode mappings
    {
      "<leader>gs",
      function()
        require("gitsigns").stage_hunk({ vim.fn.line("."), vim.fn.line("v") })
      end,
      mode = "v",
      desc = "Git: Stage Hunk (Visual)",
    },
    {
      "<leader>gr",
      function()
        require("gitsigns").reset_hunk({ vim.fn.line("."), vim.fn.line("v") })
      end,
      mode = "v",
      desc = "Git: Reset Hunk (Visual)",
    },
  },
  opts = {
    signs = {
      add = { text = "+" },
      change = { text = "~" },
      delete = { text = "_" },
      topdelete = { text = "‾" },
      changedelete = { text = "+" },
      untracked = { text = "┆" },
    },
    attach_to_untracked = true,
  },
}
