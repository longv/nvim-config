return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  keys = {
    {
      "<leader>ha",
      function()
        require("harpoon"):list():add()
      end,
    },
    {
      "<leader>hf",
      function()
        require("harpoon").ui:toggle_quick_menu(require("harpoon"):list())
      end,
    },
    {
      "<C-S-N>",
      function()
        require("harpoon"):list():next()
      end,
    },
    {
      "<C-S-P>",
      function()
        require("harpoon"):list():prev()
      end,
    },
  },
}
