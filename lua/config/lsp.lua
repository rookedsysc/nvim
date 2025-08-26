-- python
vim.lsp.enable("pyright")

-- Configure `ruff-lsp`.
-- See: https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md#ruff_lsp
-- For the default config, along with instructions on how to customize the settings
require("lspconfig").ruff_lsp.setup({
  init_options = {
    settings = {
      -- Any extra CLI arguments for `ruff` go here.
      args = {},
    },
  },
})
