return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.configs").setup({
      -- A list of parser names, or "all"
      ensure_installed = {
        "bash", "vimdoc", 
        "json", "yaml",
        "javascript", "typescript", 
        "css", "tsx", "astro",
        "markdown", "markdown_inline",
        "kotlin", "groovy",
        "gdscript", "cpp",
        "lua",
        "go",
        "python",
        "dockerfile", "terraform",
      },

      -- Install parsers synchronously (only applied to `ensure_installed`)
      sync_install = false,

      -- Automatically install missing parsers when entering buffer
      -- Recommendation: set to false if you don"t have `tree-sitter` CLI installed locally
      auto_install = true,

      indent = {
        enable = false
      },

      highlight = {
        -- `false` will disable the whole extension
        enable = true,
      },
    })

    vim.treesitter.language.register("markdown", "mdx")
  end
}
