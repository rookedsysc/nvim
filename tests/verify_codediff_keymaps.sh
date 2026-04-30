#!/usr/bin/env bash
set -euo pipefail

CONFIG_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"

make_repo() {
  local repo
  repo="$(mktemp -d)"
  (
    cd "$repo"
    git init -q
    git config user.email test@example.com
    git config user.name test
    printf 'a\nb\n' > file.txt
    git add file.txt
    git commit -qm init
    printf 'a\nb changed\n' > file.txt
  )
  printf '%s\n' "$repo"
}

run_keymap_case() {
  local key_input="$1"
  local expected_mode="$2"
  local expected_wins="${3:-}"
  local repo
  local output

  repo="$(make_repo)"
  trap 'rm -rf "$repo"' RETURN

  output="$(
    cd "$CONFIG_DIR"
    nvim --headless "$repo/file.txt" +"lua \
      local key = [[$key_input]] \
      local done = false \
      vim.api.nvim_create_autocmd('User', { \
        pattern = 'CodeDiffOpen', \
        callback = function(args) \
          done = true \
          print(('RESULT:mode=%s,wins=%d'):format(args.data.mode, vim.fn.winnr('$'))) \
          vim.cmd('qa!') \
        end, \
      }) \
      vim.defer_fn(function() \
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, false, true), 'm', false) \
      end, 200) \
      vim.defer_fn(function() \
        if not done then \
          print('RESULT:timeout') \
          vim.cmd('qa!') \
        end \
      end, 5000)" 2>&1
  )"

  if [[ -n "$expected_wins" ]]; then
    grep -q "RESULT:mode=${expected_mode},wins=${expected_wins}" <<<"$output"
  else
    grep -q "RESULT:mode=${expected_mode}," <<<"$output"
  fi
}

run_keymap_case ' gd' standalone 2
run_keymap_case ' gi' standalone 1
run_keymap_case ' gD' explorer

echo "codediff keymaps verified"
