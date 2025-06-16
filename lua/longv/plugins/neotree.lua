return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  lazy = true,
  config = function()
    vim.keymap.set("n", "<leader>pt", ":Neotree filesystem reveal left toggle<CR>", {})
  end,
}
