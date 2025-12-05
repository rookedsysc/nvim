return {
  -- Markdown LSP (marksman) 비활성화
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        marksman = { enabled = false },
      },
    },
  },
  
  -- conform.nvim에서 markdown formatter 비활성화
  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters_by_ft = {
        markdown = {},
      },
    },
  },
  
  -- nvim-lint에서 markdown linter 비활성화
  {
    "mfussenegger/nvim-lint",
    optional = true,
    opts = {
      linters_by_ft = {
        markdown = {},
      },
    },
  },
}
