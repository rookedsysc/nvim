-- ref : https://github.com/MariaSolOs/dotfiles/blob/022de739ecbf4c6c20aadf1d1be143f1f3a65967/.config/nvim/lua/plugins/copilot.lua#L4
-- Copilot completion.
return {
  {
    "zbirenbaum/copilot.lua",
    event = "InsertEnter",
    opts = {
      -- The panel is useless.
      panel = { enabled = false },
      suggestion = {
        auto_trigger = true,
        hide_during_completion = false,
        keymap = {
          accept = "<Tab>",
          accept_word = "<M-w>",
          accept_line = "<M-l>",
          next = "<M-]>",
          prev = "<M-[>",
          dismiss = "<C-/>",
        },
      },
      filetypes = {
        markdown = true,
        yaml = true,
      },
    },
  },
}
