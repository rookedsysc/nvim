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

-- Root 디렉토리를 현재 작업 디렉토리(cwd) 기준으로 설정
-- .git 폴더가 아닌 nvim을 실행한 폴더를 기준으로 함
vim.g.root_spec = { "cwd" }

-- 전역 autoformat 비활성화 (특정 파일타입만 autocmd로 활성화)
vim.g.autoformat = false
