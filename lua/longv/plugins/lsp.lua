return {
  "VonHeikemen/lsp-zero.nvim",
  dependencies = {
    "neovim/nvim-lspconfig",
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-nvim-lua",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "saadparwaiz1/cmp_luasnip",
    "L3MON4D3/LuaSnip",
    "rafamadriz/friendly-snippets",
  },
  config = function()
    local lsp_zero = require("lsp-zero")

    lsp_zero.on_attach(function(client, bufnr)
      lsp_zero.default_keymaps({buffer = bufnr})
      lsp_zero.buffer_autoformat()

      vim.keymap.set("n", "gk", "<cmd>lua vim.lsp.buf.hover()<cr>", {buffer = bufnr})
    end)

    lsp_zero.set_sign_icons({
      error = "✘",
      warn = "▲",
      hint = "⚑",
      info = "»"
    })

    require("mason").setup({})
    require("mason-lspconfig").setup({
      ensure_installed = {
        "tsserver", 
        "tailwindcss",
        "kotlin_language_server", 
        "gradle_ls",
        "astro", 
        "gopls",
        "marksman",
        "mdx_analyzer",
        "jsonls",
        "pylsp",
        "ast_grep",
      },
      handlers = {
        lsp_zero.default_setup,
        lua_ls = function()
          local lua_opts = lsp_zero.nvim_lua_ls()
          require("lspconfig").lua_ls.setup(lua_opts)
        end,
        marksman = function()
          require("lspconfig").marksman.setup {
            filetypes = { "markdown" }
          }
        end,
        ast_grep = function()
          require("lspconfig").ast_grep.setup {
            filetypes = { "cpp" }
          }
        end,
      }
    })

    require("lspconfig").gdscript.setup({})

    local cmp = require("cmp")
    local cmp_action = require("lsp-zero").cmp_action()

    -- This is the function that loads the extra snippets to luasnip
    -- from rafamadriz/friendly-snippets
    require("luasnip.loaders.from_vscode").lazy_load()

    cmp.setup({
      sources = {
        {name = "path"},
        {name = "nvim_lsp"},
        {name = "nvim_lua"},
        {name = "luasnip", keyword_length = 2},
        {name = "buffer", keyword_length = 2},
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-u>"] = cmp.mapping.scroll_docs(-4),
        ["<C-d>"] = cmp.mapping.scroll_docs(4),
        ["<Tab>"] = cmp_action.tab_complete(),
        ["<S-Tab>"] = cmp_action.select_prev_or_fallback(),
        ["<CR>"] = cmp.mapping.confirm({ select = false }),
      }),
      snippet = {
        expand = function(args)
          require('luasnip').lsp_expand(args.body)
        end,
      },
    })
  end
}
