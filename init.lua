require("core.options") -- Require general configs
require("core.keymaps") -- Require general keymaping
require("core.snippets") -- Custom code snippets

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		error("Error cloning lazy.nvim:\n" .. out)
	end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
	require("plugins.alpha"),
	require("plugins.autocompletion"),
	require("plugins.bufferline"),
	require("plugins.colortheme"),
	require("plugins.comment"),
	require("plugins.gitsigns"),
	require("plugins.indent-bankline"),
	require("plugins.lsp"),
	require("plugins.lualine"),
	require("plugins.misc"),
	require("plugins.neotree"),
	require("plugins.none-ls"),
	require("plugins.telescope"),
	require("plugins.treesitter"),
})
