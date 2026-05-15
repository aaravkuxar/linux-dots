-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- vim.keymap.set("t", "<Esc>", [[<C-\><C-n>]], { noremap = true, silent = true })
vim.keymap.set("n", "<C-p>", ":Files<CR>", { silent = true })
vim.keymap.set("n", "<leader>fg", ":Rg<CR>", { silent = true })
vim.keymap.set("n", "<leader>fb", ":Buffers<CR>", { silent = true })
-- Open current working directory
vim.keymap.set("n", "<leader>e", function()
  require("mini.files").open(vim.loop.cwd())
end, { desc = "Mini Files (cwd)" })

-- Open project root (LazyVim root detection)
vim.keymap.set("n", "<leader>E", function()
  local root = require("lazyvim.util").root()
  require("mini.files").open(root)
end, { desc = "Mini Files (root)" })
vim.keymap.set("n", "x", '"_x')
