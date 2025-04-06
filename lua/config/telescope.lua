local telescope = require("telescope")
local actions = require("telescope.actions")

telescope.setup({
  defaults = {
    mappings = {
      i = {
        ["<C-q>"] = actions.close
      },
    },
    file_ignore_patterns = { 
      "node_modules", 
      ".git/" 
    },
  },
  pickers = {
    find_files = {
      hidden = true, 
    },
  },
  extensions = { 
    fzf = {
      fuzzy = true,                          -- fuzzy matching
      override_generic_sorter = true,         -- override the generic sorter
      override_file_sorter = true,            -- override the file sorter
      case_moed = "smart_case",               -- "smart_case" | "ignore_case" | "respect_case"
    },
  },
  
})

-- load fzf extension if able
pcall(telescope.load_extension, "fzf")
