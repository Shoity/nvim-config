-- Definir leader key antes de carregar plugins
vim.g.mapleader = " "               -- tecla <space> será usada como <leader>
vim.g.maplocalleader = " "

-- Opções básicas de edição
vim.opt.number = true               -- mostra número das linhas
vim.opt.relativenumber = true       -- número relativo nas linhas
vim.opt.tabstop = 2                 -- largura de tab em espaços
vim.opt.shiftwidth = 2              -- largura de indentação
vim.opt.expandtab = true            -- converte tab em espaços
vim.opt.smartindent = true          -- indentação inteligente
vim.opt.wrap = false                -- não quebra linha automática
vim.opt.cursorline = true           -- destaca a linha do cursor

-- Busca
vim.opt.ignorecase = true           -- ignora CaseSensitive em buscas
vim.opt.smartcase = true            -- exceto se usar letras maiúsculas

-- Interface
vim.opt.termguicolors = true        -- ativa suporte a cores verdadeiras
vim.opt.signcolumn = "yes"          -- sempre mostrar coluna de sinais

-- Clipboard
vim.opt.clipboard = "unnamedplus"   -- usa o clipboard do sistema (no WSL, funciona bem)

-- BOOTSTRAP: instala lazy.nvim automaticamente se não existir
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git", "clone", "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Carrega o Lazy e prepara para receber plugins (mesmo que esteja com uma lista vazia)
require("lazy").setup({
  -- Treesitter (Highlight)
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",                                                                          -- Atualiza parsers ao instalar
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "lua", "vim", "bash", "python", "typescript", "javascript", "go"},   -- linguagens desejadas
        highlight = {
          enable = true,
        },
        indent = {
          enable = true                                                                           -- ativa indentação baseada na árvore sintática
        }
      })
    end,
  },
  -- LSP + Autocomplete
  {
    "neovim/nvim-lspconfig",
    config = function()
      local lspconfig = require("lspconfig")

      -- Configura cada servidor

      --  Iniciando pelas configs do Lua
      lspconfig.lua_ls.setup({
        settings = {
          Lua = {
            diagnostics = { globals = { "vim" } },
          },
        }
      })
    -- Go
    lspconfig.pyright.setup({})
    -- Bash
    lspconfig.bashls.setup({})
    -- TypeScript, JavaScript, React (TSX)
    lspconfig.ts_ls.setup({})
    -- HTML
    lspconfig.html.setup({})
    -- CSS
    lspconfig.cssls.setup({})
    -- Emmet (suporte de autocomplete HTML/CSS)
    lspconfig.emmet_ls.setup({})

    end,
    dependencies = {"williamboman/mason-lspconfig.nvim"}
  },

  {
    "williamboman/mason.nvim",
    build = ":masonUpdate",
    config = function()
      require("mason").setup()
    end,
  },

  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = {"lua_ls" , "pyright", "bashls", "marksman" },  -- servidores que deseja instalar
      })
    end,
    dependencies = {"williamboman/mason.nvim"}
  },

  -- Autocomplete
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
	      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
      },

      config = function()
	local cmp = require("cmp")
        local luasnip = require("luasnip")

	cmp.setup({
	      snippet = {
		expand = function(args)
		  luasnip.lsp_expand(args.body)
		end,
	      },
	      mapping = cmp.mapping.preset.insert({
		["<Tab>"] = cmp.mapping.select_next_item(),
		["<S-Tab>"] = cmp.mapping.select_prev_item(),
		["<CR>"] = cmp.mapping.confirm({ select = true }),
	      }),
	    sources = { 
	      { name = "nvim_lsp" },
	      { name = "luasnip" },
	    },
	  })
  end,
  }






})
