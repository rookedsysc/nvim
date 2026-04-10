return {
  "esmuellert/codediff.nvim",
  cmd = "CodeDiff",
  keys = {
    { "<leader>gd", "<cmd>CodeDiff<cr>", desc = "Git Diff (CodeDiff)" },
    { "<leader>gH", "<cmd>CodeDiff history<cr>", desc = "Git History (CodeDiff)" },
  },
  opts = {
    diff = {
      layout = "side-by-side",
      ignore_trim_whitespace = true,
      jump_to_first_change = true,
      compute_moves = true,
    },
    explorer = {
      position = "left",
      width = 40,
      view_mode = "tree",
      flatten_dirs = true,
    },
    keymaps = {
      view = {
        quit = "q",
        next_hunk = "]c",
        prev_hunk = "[c",
        next_file = "]f",
        prev_file = "[f",
        diff_get = "do",
        diff_put = "dp",
        toggle_stage = "-",
        stage_hunk = "<leader>hs",
        unstage_hunk = "<leader>hu",
        discard_hunk = "<leader>hr",
        toggle_layout = "t",
        show_help = "g?",
      },
    },
  },
}
