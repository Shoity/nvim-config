-- Tema Everforest
vim.g.everforest_background = "medium"
vim.g.everforest_enable_italic = true
vim.g.everfores_disable_italic_comment = 0
vim.cmd.colorscheme('everforest')

-- Tema TokyoNight

-- Lualine
require("lualine").setup({
  options = {
    theme = "everforest",
    section_separators = '',
    component_separators = '',
  },
})

-- Ícones (devicons)
require("nvim-web-devicons").setup({ default = true })

