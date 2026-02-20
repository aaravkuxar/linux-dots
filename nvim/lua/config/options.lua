-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.g.autoformat = false
vim.api.nvim_create_autocmd("BufEnter", {
  callback = function()
    vim.opt.formatoptions:remove { "c", "r", "o" }
  end,
  desc = "Disable New Line Comment",
})
<<<<<<< HEAD
vim.cmd("colorscheme default")
vim.opt.termguicolors = false
-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Wrap text
vim.opt.wrap = true

-- Syntax highlighting (already enabled by default in Neovim)
vim.cmd("syntax on")
vim.cmd("colorscheme vim")
vim.opt.cursorline = false
=======
>>>>>>> 2cf82bdedbc0b49128afe48188a261d6b701a40e
