-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Clipboard 안씀 -> XClip 사용
vim.opt.clipboard = "unnamedplus"

-- UTF-8 인코딩 설정
vim.opt.encoding = "utf-8"
vim.opt.fileencoding = "utf-8"
vim.opt.fileencodings = "utf-8"

-- 절대 라인 번호 표시
vim.opt.number = true
vim.opt.relativenumber = false -- 상대 라인 번호 비활성화
