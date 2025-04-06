local keymap = vim.keymap.set
local opts = { noremap = true, silent = true }

-- TreeSitter
keymap("n", "<leader>e", ":NvimTreeToggle<CR>", { desc = "Open file tree" })

-- Telescope
keymap("n", "<leader>ff", "<cmd>Telescope find_files<cr>", opts)             -- Search files
keymap("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", opts)              -- Search contents
keymap("n", "<leader>fb", "<cmd>Telescope buffers<cr>", opts)                -- Opened Buffers 
keymap("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", opts)              -- Help_tags of NeoVim






