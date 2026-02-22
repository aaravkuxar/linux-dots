-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.cmd("highlight clear")
vim.cmd("syntax reset")
vim.cmd("colorscheme default")
vim.g.autoformat = false
vim.api.nvim_create_autocmd("BufEnter", {
  callback = function()
    vim.opt.formatoptions:remove { "c", "r", "o" }
  end,
  desc = "Disable New Line Comment",
})
-- vim.cmd("colorscheme default")
vim.opt.termguicolors = false;
-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Wrap text
vim.opt.wrap = true

-- Syntax highlighting (already enabled by default in Neovim)
vim.cmd("syntax on")
vim.cmd("colorscheme vim")
vim.opt.cursorline = false
vim.api.nvim_set_hl(0, "Normal", {})
vim.api.nvim_set_hl(0, "NormalNC", {})
vim.api.nvim_set_hl(0, "NormalFloat", {})
vim.api.nvim_set_hl(0, "SignColumn", {})
vim.api.nvim_set_hl(0, "EndOfBuffer", {})
vim.api.nvim_create_autocmd("ColorScheme", {
  callback = function()
    vim.api.nvim_set_hl(0, "Pmenu", { bg = "NONE" })
    vim.api.nvim_set_hl(0, "PmenuSel", { reverse = true })
    vim.api.nvim_set_hl(0, "PmenuSbar", { bg = "NONE" })
    vim.api.nvim_set_hl(0, "PmenuThumb", { bg = "NONE" })
  end,
})
vim.api.nvim_create_autocmd("ColorScheme", {
  callback = function()
    -- Reset diff highlights to classic Vim style
    vim.api.nvim_set_hl(0, "DiffAdd",    { bg = "DarkGreen" })
    vim.api.nvim_set_hl(0, "DiffDelete", { bg = "DarkRed" })
    vim.api.nvim_set_hl(0, "DiffChange", { bg = "DarkBlue" })
    vim.api.nvim_set_hl(0, "DiffText",   { bg = "Blue" })
  end,
})
