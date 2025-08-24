-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set

-- 정의로 이동
map("n", "<F2>", vim.lsp.buf.definition, { desc = "Go to Definition" })

-- Oil
vim.keymap.set("n", "oi", "<CMD>Oil<CR>", { desc = "Open Oil with file's current directory" })
