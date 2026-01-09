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
|                   | n    | `gD`           | 선언으로 이동                                  |
| **LSP**           | n    | `<leader>ca`   | Code Action (Auto Import, Quick Fix 등)       |
|                   | n    | `<leader>cr`   | 심볼 이름 변경 (Rename)                        |
|                   | n    | `<leader>cf`   | 코드 포맷팅                                    |
|                   | n    | `K`            | Hover 문서 보기                                |
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
| **Claude Code**   | n    | `<leader>ac`   | Claude Code 토글                               |
|                   | n    | `<leader>af`   | Claude Code 포커스                             |
|                   | n    | `<leader>ar`   | Claude Code 재개 (Resume)                      |
|                   | n    | `<leader>aC`   | Claude Code 계속 (Continue)                    |
|                   | n    | `<leader>am`   | Claude 모델 선택                               |
|                   | n    | `<leader>ab`   | 현재 버퍼 추가                                 |
|                   | v    | `<leader>as`   | 선택 영역 Claude에 전송                        |
|                   | n    | `<leader>aa`   | Diff 승인                                      |
|                   | n    | `<leader>ad`   | Diff 거부                                      |
| **AI Copilot**    | n,v  | `<leader>aa`   | CopilotChat 토글                               |
|                   | n,v  | `<leader>ax`   | CopilotChat 대화 초기화                        |
|                   | n,v  | `<leader>aq`   | 빠른 질문 (Quick Chat)                         |
|                   | n,v  | `<leader>ap`   | 프롬프트 액션 선택                             |
|                   | chat | `<C-s>`        | 프롬프트 전송                                  |

## 🧭 Config

### Claude Code

**사용 플러그인**: [coder/claudecode.nvim](https://github.com/coder/claudecode.nvim)

- **의존성**: folke/snacks.nvim
- **요구사항**: Claude Code CLI 설치 필요

**설정 확인**:

```vim
# Claude Code 연결 상태 확인
:ClaudeCodeStatus

# 디버그 로깅 활성화 (필요시)
# lua/plugins/claude-code.lua 파일에 추가:
opts = {
  log_level = "debug",
}
```

**사용 팁**:

1. `<leader>ab`로 현재 버퍼를 Claude에 추가
2. Visual 모드에서 코드 선택 후 `<leader>as`로 전송
3. Oil이나 NvimTree에서 `<leader>as`로 파일 추가
4. Diff 제안이 나타나면 `<leader>aa`로 승인 또는 `<leader>ad`로 거부

### Python

**사용 플러그인**: pylsp (Python Language Server Protocol)

- **기본 설정**: `uv add pylsp, pylsp-mypy, mypy, ruff`
- **주요 기능**:
  - **rope_autoimport**: 자동 import 제안 (Code Action 통합)
  - **ruff**: 빠른 linting 및 import 정리
  - **mypy**: 강력한 타입 체킹
  - **rope**: 리팩토링 및 auto-import 기능

**Auto Import 사용법**:

1. 정의되지 않은 심볼(예: 함수, 클래스)에 커서를 위치
2. `<leader>ca` 키로 Code Action 메뉴 열기
3. "Import ..." 옵션 선택하여 자동으로 import 문 추가

**주요 설정** (`lua/plugins/nvim-lspconfig.lua`):

```lua
rope_autoimport = {
  enabled = true,
  code_actions = true,  -- Code Action으로 자동 import 제공
}
```

### TypeScript/JavaScript

**사용 플러그인**: tsserver (TypeScript Language Server)

- **기본 설정**: LazyVim extras (`lang.typescript`) 자동 설치
- **주요 기능**:
  - **Auto Import**: 자동 import 제안 및 추가
  - **Organize Imports**: import 문 자동 정리
  - **Quick Fix**: 타입 에러 자동 수정 제안
  - **Code Actions**: 리팩토링 및 코드 개선 제안

**Auto Import 사용법**:

1. **Code Action 방식**:
   - 정의되지 않은 심볼에 커서 위치
   - `<leader>ca` 키로 Code Action 메뉴 열기
   - "Import ..." 옵션 선택하여 자동으로 import 문 추가

2. **자동 완성 방식**:
   - 코드 작성 중 자동완성 메뉴에서 심볼 선택
   - tsserver가 자동으로 import 문 추가

3. **Import 정리**:
   - `<leader>ca` 후 "Organize Imports" 선택
   - 사용하지 않는 import 제거 및 정렬

**추가 기능**:
- `<leader>co`: Source Action (Organize Imports, Remove Unused 등)
- `<leader>cR`: 파일 이름 변경 및 import 경로 자동 업데이트

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

## 📚 핵심 개념

### CMP (Completion Engine)

**자동완성 엔진**으로, 사용자가 코드를 작성할 때 실시간으로 완성 제안을 제공합니다.

- **역할**: LSP, Copilot, 버퍼, 경로 등 다양한 소스의 완성 제안을 통합하여 UI로 표시
- **현재 사용**: **blink.cmp** (LazyVim 2025년 기본값)
- **주요 소스**:
  - `lsp`: LSP 서버의 자동완성
  - `copilot`: GitHub Copilot AI 제안
  - `buffer`: 현재 버퍼의 텍스트
  - `path`: 파일 경로
  - `snippets`: 코드 스니펫

### LSP (Language Server Protocol)

**언어 서버 프로토콜**은 에디터와 언어 서버 간의 표준 프로토콜입니다.

- **주요 기능**:
  - 자동완성 (Autocompletion)
  - 정의로 이동 (Go to Definition)
  - 참조 찾기 (Find References)
  - 진단 (Diagnostics - 오류/경고)
  - 코드 액션 (Code Actions)
  - 리팩토링 (Refactoring)

## 🔍 현재 설정 분석

### Completion Engine

**blink.cmp**를 사용 중이며, 다음과 같이 통합되어 있습니다:

```lua
sources = { "lsp", "path", "snippets", "buffer", "copilot" }
```

- ✅ **중복 없음**: nvim-cmp는 사용하지 않음 (example.lua는 비활성화됨)
- ✅ **Copilot 통합**: blink.cmp의 source로 완벽하게 통합
  - suggestion/panel 비활성화하여 모든 제안이 blink.cmp를 통해 표시
  - ghost text 없이 completion menu에서 일관된 UI 제공

### LSP 서버 상세

현재 활성화된 LSP 서버와 설정:

| 언어 | LSP 서버 | 추가 도구 | 특징 |
|------|---------|----------|------|
| **Python** | pylsp | ruff (linting), mypy (타입 체킹), rope (auto-import) | uv 런타임 사용, pyright 비활성화 |
| **Java** | jdtls | Java Test, Debug Adapter, Spring Boot Tools | nvim-java가 자동 관리 |
| **TypeScript/JS** | tsserver | - | LazyVim extras |
| **JSON** | jsonls | schemastore | LazyVim extras |
| **YAML** | yamlls | - | LazyVim extras |
| **Docker** | dockerls | - | LazyVim extras |
| **Kotlin** | kotlin_language_server | - | LazyVim extras |
| **Scala** | metals | - | LazyVim extras |
| **TOML** | taplo | - | LazyVim extras |

## 📊 2025 트렌드 비교

### blink.cmp vs nvim-cmp

**현재 사용**: blink.cmp ✅

| 비교 항목 | blink.cmp (사용 중) | nvim-cmp (레거시) |
|----------|---------------------|-------------------|
| **성능** | 0.5-4ms (키 입력당) | 60ms debounce + 2-50ms hitches |
| **Fuzzy Matcher** | Rust 기반 frizbee (fzf 대비 6배 빠름) | fzf 스타일 |
| **기본 소스** | LSP, buffer, path, snippets 내장 | 모두 외부 플러그인 필요 |
| **Fuzzy Matching** | Typo-resistant (오타 허용) | 표준 fuzzy |
| **Scoring** | Frecency + Proximity | Proximity + 선택적 Recency |
| **트렌드** | 2025년 LazyVim 기본값 | 호환성 유지 (Neovim 0.9) |

**참고 자료**:
- [blink.cmp GitHub](https://github.com/Saghen/blink.cmp)
- [LazyVim Discussion: How to replace blink.cmp with nvim-cmp?](https://github.com/LazyVim/LazyVim/discussions/6388)
- [kickstart.nvim Issue: Use blink.cmp over nvim-cmp?](https://github.com/nvim-lua/kickstart.nvim/issues/1331)

### Python LSP: pyright vs pylsp

**현재 사용**: pylsp + ruff + mypy ✅

| 비교 항목 | pyright (일반적 선택) | pylsp (사용 중) |
|----------|----------------------|-----------------|
| **속도** | 빠름 | 보통 |
| **타입 체킹** | 강력한 내장 타입 체킹 | mypy 통합으로 보완 |
| **의존성** | Node.js 필요 | Python만 필요 |
| **유연성** | 설정 옵션 적음 | 매우 유연한 플러그인 시스템 |
| **ML 라이브러리** | 일부 지원 부족 (opencv 등) | 플러그인으로 확장 가능 |
| **Auto-import** | 내장 | rope 플러그인 필요 |
| **LazyVim 기본값** | pyright (또는 basedpyright) | - |

**현재 설정의 장점**:
- ✅ Node.js 의존성 없음
- ✅ ruff로 빠른 linting
- ✅ mypy로 강력한 타입 체킹
- ✅ rope로 auto-import 기능
- ✅ 높은 확장성

**참고 자료**:
- [LazyVim Python LSP](https://www.lazyvim.org/extras/lang/python)
- [nvimdots Discussion: pyright vs pylsp](https://github.com/ayamir/nvimdots/discussions/708)
- [Getting the Best Python LSP for Neovim](https://toxigon.com/neovim-best-python-lsp)

### 결론

**✅ 현재 설정은 2025년 트렌드에 부합합니다:**

1. **blink.cmp**: LazyVim의 최신 기본값 사용 중
2. **LSP 서버**: 각 언어별 표준 또는 우수한 대안 사용
3. **Python**: pylsp가 pyright보다 덜 일반적이지만, ruff + mypy 통합으로 동등한 기능 제공
4. **중복 없음**: 모든 도구가 명확한 역할 분담

**개선 고려 사항** (선택적):
- Python에서 더 빠른 타입 체킹을 원하면 pyright로 전환 고려
- 하지만 현재 pylsp + ruff + mypy 조합도 충분히 효율적

## 🔌 설치된 플러그인 및 도구

### LazyVim Extras

현재 활성화된 LazyVim extras 목록:

- **formatting.prettier** - Prettier 포맷터
- **lang.docker** - Docker 파일 지원
- **lang.java** - Java 개발 환경
- **lang.json** - JSON 지원
- **lang.kotlin** - Kotlin 개발 환경
- **lang.markdown** - Markdown 지원
- **lang.python** - Python 개발 환경
- **lang.scala** - Scala 개발 환경
- **lang.toml** - TOML 파일 지원
- **lang.typescript** - TypeScript/JavaScript 개발 환경
- **lang.yaml** - YAML 파일 지원

### 커스텀 플러그인

| 플러그인 | 용도 | 설정 파일 |
|---------|------|-----------|
| **zbirenbaum/copilot.lua** | GitHub Copilot AI 자동완성 | `lua/plugins/copilot.lua` |
| **fang2hou/blink-copilot** | Copilot blink.cmp 통합 | `lua/plugins/copilot.lua` |
| **CopilotChat.nvim** | Copilot 대화형 AI | `lua/plugins/copilot-chat.lua` |
| **coder/claudecode.nvim** | Claude Code 통합 | `lua/plugins/claude-code.lua` |
| **stevearc/oil.nvim** | 파일 탐색기 | `lua/plugins/oil.lua` |
| **nvim-java** | Java 개발 환경 | `lua/plugins/java.lua` |
| **nvim-dap** | 디버깅 지원 | `lua/plugins/dap.lua` |

### LSP 서버

| 언어 | LSP 서버 | 추가 도구 | 설정 |
|------|---------|----------|------|
| **Python** | pylsp | ruff (linting), mypy (타입 체킹), rope (auto-import) | `lua/plugins/nvim-lspconfig.lua` |
| **Java** | jdtls | Java Test, Debug Adapter, Spring Boot Tools | `lua/plugins/java.lua` |
| **TypeScript/JavaScript** | tsserver | - | LazyVim extras |
| **JSON** | jsonls | schemastore | LazyVim extras |
| **YAML** | yamlls | - | LazyVim extras |
| **Docker** | dockerls | - | LazyVim extras |
| **Kotlin** | kotlin_language_server | - | LazyVim extras |
| **Scala** | metals | - | LazyVim extras |
| **TOML** | taplo | - | LazyVim extras |
| **Markdown** | ❌ 비활성화 | - | `lua/plugins/markdown.lua` |

### Linter & Formatter

LazyVim은 기본적으로 다음 도구들을 사용합니다:

- **conform.nvim** - 코드 포맷팅
  - Python: ruff
  - TypeScript/JavaScript: prettier
  - JSON: prettier
  - Markdown: ❌ 비활성화
  
- **nvim-lint** - 코드 린팅
  - Python: ruff + mypy (pylsp 통합)
  - Markdown: ❌ 비활성화

### Copilot 설정

**사용 플러그인**:
- [zbirenbaum/copilot.lua](https://github.com/zbirenbaum/copilot.lua)
- [fang2hou/blink-copilot](https://github.com/fang2hou/blink-copilot)

**설정 방식**:
- Copilot 제안이 blink.cmp completion menu에 통합되어 표시
- Ghost text(회색 텍스트) 비활성화
- 모든 제안이 completion dialog에서 일관되게 표시
- LazyVim의 기본 completion 엔진인 blink.cmp와 완벽하게 통합

**로그인 방법**:

```vim
# Neovim에서 Copilot 인증
:Copilot auth
```

브라우저가 열리고 GitHub 인증 코드 입력 화면이 나타납니다.
화면의 안내에 따라 인증 코드를 입력하면 로그인이 완료됩니다.

**상태 확인**:

```vim
# Copilot 상태 확인
:Copilot status

# Copilot 비활성화/활성화
:Copilot disable
:Copilot enable
```

**사용 방법**:

1. Insert 모드에서 코드를 작성하면 자동으로 Copilot 제안이 completion menu에 표시됩니다
2. `<C-n>` / `<C-p>` 키로 제안 항목 간 이동
3. `<Tab>` 또는 `<CR>`로 선택한 제안 적용
4. `<C-e>`로 completion menu 닫기

**설정 파일**: `lua/plugins/copilot.lua`

