local nvimtree = require("nvim-tree")

nvimtree.setup({
  view = {
    width = 30,
    relativenumber = true,
  },
  renderer = {
    group_empty = true,
    highlight_git = true,
    icons = {
      show = {
        file = true,
        folder = true,
        folder_arrow = true,
        git = true,
      },
    },
  },
  filters = {
    dotfiles = false              -- Show hidden files
  },
  git = {
    enable = true
  },
})
