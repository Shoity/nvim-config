local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = {
          "lua",
          "vim",
          "bash",
          "python",
          "go",
          "typescript",
          "javascript",
          "vimdoc",
          "luadoc",
          "markdown"
        },
        highlight = { enable = true },
        indent = { enable = true }
      })
    end
  },
  -- Mason
  {
    "williamboman/mason.nvim",
    build = ":MasonUpdate",
    config = true
  },
  {
    "williamboman/mason-lspconfig.nvim",
    dependencies = { "williamboman/mason.nvim" },
    config = true
  },
  -- LSP
  { "neovim/nvim-lspconfig" },
  -- Autocomplete
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
    }
  },
  -- Nvim-tree
  {
  "nvim-tree/nvim-tree.lua",
  dependencies = {
    "nvim-tree/nvim-web-devicons",                  -- Icons setup
  },
  config = function()
    require("config.nvimtree")
  end,
  },
  -- Telescope
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.6",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("telescope").setup({
        defaults = {
          layout_config = {
            horizontal = { preview_width = 0.6 },
          },
          sorting_strategy = "ascending",
          layout_strategy = "horizontal"
        }
      })
    end,
  },
  {
    "nvim-telescope/telescope-fzf-native.nvim",
    build = "make",
    cond = function()
      return vim.fn.executable("make") == 1
    end
  },
  {
   "nvim-tree/nvim-web-devicons",
    lazy = true
  },
  -- Lualine
  {
    "nvim-lualine/lualine.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("lualine").setup({
        options = {
          theme = "everforest",
          icons_enabled = true,
          section_separators = "",
          component_separators = "",
        },
      })
    end
  },
  -- Comment.nvim
  {
    "numToStr/Comment.nvim",
    dependencies = { "JoosepAlviste/nvim-ts-context-commentstring" },
    config = function()
      require("Comment").setup{
        pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook()
      }
    end
  },
  {
    "JoosepAlviste/nvim-ts-context-commentstring",
    config = function()
      require("ts_context_commentstring").setup {}
    end
  },
  -- Icons on Autocomplete
  {
      "onsails/lspkind.nvim",
  },
  -- Themes
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
  },
  {
    'sainnhe/everforest',
    lazy = false,
    priority = 1000,
  },
  {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  lazy = false
}


})

