-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
-- Disable autoformat
vim.g.autoformat = false

-- Disable automatic comment continuation
vim.api.nvim_create_autocmd("BufEnter", {
desc = "Disable New Line Comment",
callback = function()
vim.opt.formatoptions:remove({ "c", "r", "o" })
end,
})

-- Use terminal color palette (not truecolor)
vim.opt.termguicolors = false

-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Wrap long lines
vim.opt.wrap = true

-- Cursor line off (classic Vim feel)
vim.opt.cursorline = false

-- Indentation settings
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

-- Enable syntax + classic Vim colors
vim.cmd.syntax("enable")
vim.cmd.colorscheme("vim")

-- Highlight overrides
local function apply_highlights()
-- Reset UI backgrounds so terminal theme controls colors
vim.api.nvim_set_hl(0, "Normal", {})
vim.api.nvim_set_hl(0, "NormalNC", {})
vim.api.nvim_set_hl(0, "NormalFloat", {})
vim.api.nvim_set_hl(0, "SignColumn", {})
vim.api.nvim_set_hl(0, "EndOfBuffer", {})

-- Completion popup (prevents purple background)
vim.api.nvim_set_hl(0, "Pmenu", { ctermbg = "NONE" })
vim.api.nvim_set_hl(0, "PmenuSel", { reverse = true })
vim.api.nvim_set_hl(0, "PmenuSbar", { ctermbg = "NONE" })
vim.api.nvim_set_hl(0, "PmenuThumb", { ctermbg = "NONE" })

-- Classic Vim diff colors
vim.api.nvim_set_hl(0, "DiffAdd", { ctermbg = "DarkGreen" })
vim.api.nvim_set_hl(0, "DiffDelete", { ctermbg = "DarkRed" })
vim.api.nvim_set_hl(0, "DiffChange", { ctermbg = "DarkBlue" })
vim.api.nvim_set_hl(0, "DiffText", { ctermbg = "Blue" })
end

-- Apply highlights immediately
apply_highlights()

-- Reapply highlights if colorscheme changes
vim.api.nvim_create_autocmd("ColorScheme", {
callback = apply_highlights,
})
