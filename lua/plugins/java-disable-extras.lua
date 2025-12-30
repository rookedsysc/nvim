-- LazyVim extras의 lang.java를 비활성화하여 nvim-jdtls 충돌 방지
-- nvim-java를 사용하므로 nvim-jdtls는 필요하지 않음
return {
  { "mfussenegger/nvim-jdtls", enabled = false },
}
