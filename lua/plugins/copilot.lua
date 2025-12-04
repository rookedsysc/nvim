-- ref : https://github.com/MariaSolOs/dotfiles/blob/022de739ecbf4c6c20aadf1d1be143f1f3a65967/.config/nvim/lua/plugins/copilot.lua#L4
-- Copilot completion.
return {
  {
    "zbirenbaum/copilot.lua",
    cmd = "Copilot",
    event = "InsertEnter",
    opts = {
      -- suggestion과 panel 비활성화 (blink-copilot 사용)
      suggestion = { enabled = false },
      panel = { enabled = false },
      filetypes = {
        markdown = true,
        yaml = true,
      },
    },
  },
  -- Copilot을 blink.cmp source로 통합
  {
    "saghen/blink.cmp",
    optional = true,
    dependencies = { "fang2hou/blink-copilot" },
    opts = {
      sources = {
        default = { "lsp", "path", "snippets", "buffer", "copilot" },
        providers = {
          copilot = {
            name = "copilot",
            module = "blink-copilot",
            score_offset = 100,
            async = true,
            transform_items = function(_, items)
              -- blink.cmp 아이템 포맷 커스터마이징
              for _, item in ipairs(items) do
                item.kind = require("blink.cmp.types").CompletionItemKind.Copilot
              end
              return items
            end,
          },
        },
      },
      keymap = {
        preset = "enter", -- Enter로 completion accept
        ["<Tab>"] = {
          function(cmp)
            if cmp.snippet_active() then
              return cmp.snippet_forward()
            else
              return cmp.select_next()
            end
          end,
          "fallback",
        },
        ["<S-Tab>"] = {
          function(cmp)
            if cmp.snippet_active() then
              return cmp.snippet_backward()
            else
              return cmp.select_prev()
            end
          end,
          "fallback",
        },
      },
    },
  },
}
