local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Lua
lspconfig.lua_ls.setup({
  settings = {
    Lua = {
      diagnostics = { globals = { "vim" } },
    },
  },
  capabilities = capabilities
})

-- Outros
lspconfig.pyright.setup({})
lspconfig.bashls.setup({})
lspconfig.ts_ls.setup({
  capabilities = capabilities
})
lspconfig.html.setup({})
lspconfig.cssls.setup({})
lspconfig.emmet_ls.setup({})
lspconfig.gopls.setup({})
lspconfig.marksman.setup({})

