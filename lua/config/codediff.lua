local M = {}

local function ensure_codediff_loaded()
  require("lazy").load({ plugins = { "codediff.nvim" } })
end

local function layout_flag(layout)
  if layout == "inline" then
    return "--inline"
  end
  return "--side-by-side"
end

local function buffer_path(bufnr)
  if vim.bo[bufnr].buftype ~= "" then
    return nil
  end

  local path = vim.api.nvim_buf_get_name(bufnr)
  if path == "" then
    return nil
  end

  return path
end

local function in_git_repo(path)
  local git_dir = vim.fs.find(".git", { path = path, upward = true })[1]
  return git_dir ~= nil
end

local function run_codediff(args)
  ensure_codediff_loaded()
  vim.cmd("CodeDiff " .. args)
end

function M.open_current_file(layout)
  local path = buffer_path(vim.api.nvim_get_current_buf())
  if path and in_git_repo(path) then
    run_codediff(("file HEAD %s"):format(layout_flag(layout)))
    return
  end

  vim.notify("Current buffer is not a git file; opening repository diff", vim.log.levels.INFO)
  M.open_repo(layout)
end

function M.open_repo(layout)
  run_codediff(layout_flag(layout))
end

function M.open_history()
  local path = buffer_path(vim.api.nvim_get_current_buf())
  if path and in_git_repo(path) then
    run_codediff("history %")
    return
  end

  run_codediff("history")
end

return M
