return {
  "numToStr/Comment.nvim",
  opts = {
    -- 블록 주석 키맵 활성화
    mappings = {
      basic = true,
      extra = true,
    },
    -- 키맵 설정
    opleader = {
      line = "gc",
      block = "gb",
    },
    toggler = {
      line = "gcc",
      block = "gbc",
    },
  },
  config = function(_, opts)
    require("Comment").setup(opts)
  end,
}
