-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], { noremap = true, silent = true })
vim.keymap.set("n", "<C-p>", ":Files<CR>", { silent = true })
vim.keymap.set("n", "<leader>fg", ":Rg<CR>", { silent = true })
vim.keymap.set("n", "<leader>fb", ":Buffers<CR>", { silent = true })
