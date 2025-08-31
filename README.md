# 💤 LazyVim 설정

[LazyVim](https://github.com/LazyVim/LazyVim)을 위한 개인 설정 파일입니다.
자세한 설치 방법은 [공식 문서](https://lazyvim.github.io/installation)를 참고하세요.

## 🏗️ 커맨드

- **LazyExtras** : 새로운 플러그인 찾을 때 유용
  - x : 설치
  - / : 검색

## 🎯 핵심 단축키

| 기능              | 모드 | 키맵           | 설명                                           |
| ----------------- | ---- | -------------- | ---------------------------------------------- |
| **Oil 파일 관리** | n    | `oi`           | Oil 파일 탐색기                                |
| **편집**          | v    | `gc`           | 그렙한 라인 주석                               |
|                   | v    | `*` + :%s//foo | 선택한 라인 모두 찾아서 일괄 변경              |
| **탭 이동**       | n    | `<S-hl>`       | 왼쪽/오른쪽 탭으로 이동                        |
| **윈도우 이동**   | n    | `<C-hjkl>`     | 윈도우 이동                                    |
| **네비게이션**    | n    | `gd`           | 정의로 이동                                    |
|                   | n    | `<C-o>`        | 이전 포커스로 이동                             |
|                   | n    | `gr`           | 참조로 이동(cmd + b / cmd + 마우스클릭에 해당) |
|                   | n    | `gd`           | 정의로 이동                                    |
| **터미널**        | n    | `:term`        | 현재 창에서 터미널                             |
|                   | n    | `!{cmd}`       | 외부 명령어 실행                               |
|                   | t    | `<C-\><C-n>`   | 터미널 → 일반 모드                             |
| **디버깅**        | n    | `<leader>dp`   | 브레이크포인트 토글                            |
|                   | n    | `<leader>dc`   | 디버깅 시작/계속                               |
|                   | n    | `<leader>do`   | 스텝 오버                                      |
|                   | n    | `<leader>di`   | 스텝 인                                        |
|                   | n    | `<leader>dO`   | 스텝 아웃                                      |
|                   | n    | `<leader>dq`   | 디버깅 종료                                    |
|                   | n    | `<leader>du`   | 디버그 UI 토글                                 |
| **AI Copilot**    | n,v  | `<leader>aa`   | CopilotChat 토글                               |
|                   | n,v  | `<leader>ax`   | CopilotChat 대화 초기화                        |
|                   | n,v  | `<leader>aq`   | 빠른 질문 (Quick Chat)                         |
|                   | n,v  | `<leader>ap`   | 프롬프트 액션 선택                             |
|                   | chat | `<C-s>`        | 프롬프트 전송                                  |

## 🧭 Config

### Python

- pylsp 사용
- 기본 설정 **uv add pylsp, pylsp-mypy, mypy, ruff**

### Java

**사용 플러그인**: [nvim-java](https://github.com/nvim-java/nvim-java)

- **기본 설정**: nvim-java가 jdtls를 자동 관리
- **요구사항**: Java 17 이상 필요
- **자동 설치**: JDK, Java Test, Debug Adapter 자동 설치 지원

**주요 기능**:

- LSP (언어 서버): 자동 완성, 오류 검사, 리팩토링
- 테스트 실행: Java Test 통합
- 디버깅: nvim-dap 통합 디버그 어댑터
- Spring Boot: Spring Boot Tools 지원

**설치 후 확인**:

```bash
# Mason 설치 확인
:MasonLog
# Java 프로젝트에서 LSP 상태 확인
:LspInfo
```

**Lombok 문제 해결**:

```bash
# lombok.jar 다운로드 및 설치 (필요시)
curl -L https://projectlombok.org/downloads/lombok.jar -o /tmp/lombok.jar
cp /tmp/lombok.jar ~/.local/share/nvim/mason/packages/jdtls/lombok.jar
```

## 🔧 트러블슈팅

### Java/Lombok 에러

**에러**: `Error opening zip file or JAR manifest missing : lombok.jar`

**원인**:

- lombok.jar 파일 경로 오류
- 파일 손상 또는 불완전한 다운로드
- JDTLS와 Lombok 버전 호환성 문제

**해결 방법**:

1. **Lombok JAR 파일 재설치**:

```bash
# 기존 파일 삭제
rm ~/.local/share/nvim/mason/packages/jdtls/lombok.jar

# 최신 버전 다운로드
curl -L https://projectlombok.org/downloads/lombok.jar -o /tmp/lombok.jar

# Mason jdtls 디렉토리에 복사
cp /tmp/lombok.jar ~/.local/share/nvim/mason/packages/jdtls/lombok.jar

# 파일 권한 확인
chmod 644 ~/.local/share/nvim/mason/packages/jdtls/lombok.jar
```

2. **JAR 파일 무결성 확인**:

```bash
# JAR 파일이 유효한지 확인
jar tf ~/.local/share/nvim/mason/packages/jdtls/lombok.jar | head
```

3. **Neovim 완전 재시작**:

- Neovim을 완전히 종료하고 다시 시작
- `:LspRestart` 명령어로 LSP 서버 재시작

4. **Mason 재설치** (극단적인 경우):

```bash
# Mason 캐시 초기화
rm -rf ~/.local/share/nvim/mason
```

### Copilot.lua 에러

**에러**: `BugIndicatingError: Assertion Failed: unexpected state`

**원인**:

- Copilot.lua 플러그인 내부 상태 동기화 문제
- LSP 클라이언트와 Copilot 서비스 간 통신 오류
- 플러그인 버전 호환성 문제

**해결 방법**:

1. **플러그인 업데이트**:

```vim
:Lazy sync
```

2. **Copilot 재인증**:

```vim
:Copilot auth
```

3. **LSP 클라이언트 상태 확인**:

```vim
:lua print(vim.inspect(require("copilot.client").status()))
```

4. **Copilot 서비스 재시작**:

```vim
:Copilot disable
:Copilot enable
```

5. **디버그 로깅 활성화** (설정 파일에 추가):

```lua
require("copilot").setup({
  panel = { enabled = true },
  suggestion = { enabled = true },
  copilot_node_command = "node",
  server_opts_overrides = {
    trace = "verbose",
    settings = {
      advanced = {
        listCount = 10,
        inlineSuggestCount = 3,
      }
    }
  }
})
```

6. **완전한 초기화** (극단적인 경우):

```bash
# Copilot 관련 캐시 및 설정 삭제
rm -rf ~/.config/github-copilot
rm -rf ~/.local/share/nvim/copilot
```

### 일반적인 해결 방법

1. **Neovim 버전 확인 및 업데이트**:

```bash
nvim --version
# 최신 버전으로 업데이트 권장 (0.10+ 필요)
```

2. **플러그인 의존성 확인**:

```vim
:checkhealth
```

3. **로그 파일 확인**:

```vim
:messages
:LspLog
```
