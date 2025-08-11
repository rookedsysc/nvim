# 💤 LazyVim 설정

[LazyVim](https://github.com/LazyVim/LazyVim)을 위한 개인 설정 파일입니다.
자세한 설치 방법은 [공식 문서](https://lazyvim.github.io/installation)를 참고하세요.

## 🎯 자주 사용하는 키맵

### 파일 및 검색
| 키맵 | 설명 |
|------|------|
| `<leader><space>` | 파일 찾기 (현재 디렉토리) |
| `<leader>/` | 텍스트 검색 (grep) |
| `<leader>ff` | 파일 찾기 |
| `<leader>fr` | 최근 파일 |
| `<leader>sk` | 키맵 검색 (Telescope) |

### 버퍼 관리
| 키맵 | 설명 |
|------|------|
| `<S-h>` | 이전 버퍼 |
| `<S-l>` | 다음 버퍼 |
| `<S-w>` | 버퍼 삭제 |
| `<leader>bb` | 다른 버퍼로 전환 |
| `<leader>bd` | 버퍼 삭제 |

### 윈도우 관리
| 키맵 | 설명 |
|------|------|
| `<C-h/j/k/l>` | 윈도우 간 이동 |
| `<leader>-` | 아래로 분할 |
| `<leader>\|` | 오른쪽으로 분할 |
| `<leader>wd` | 윈도우 삭제 |

### 코드 편집
| 키맵 | 설명 |
|------|------|
| `gd` | 정의로 이동 |
| `K` | 정보 표시 (hover) |
| `<leader>ca` | 코드 액션 |
| `<leader>cr` | 이름 변경 |
| `<leader>cf` | 코드 포맷팅 |
| `<C-s>` | 파일 저장 |

## 📋 기타 유용한 키맵

### 진단 (Diagnostics)
| 키맵 | 설명 |
|------|------|
| `]d` | 다음 오류로 이동 |
| `[d` | 이전 오류로 이동 |
| `<leader>cd` | 현재 줄 진단 정보 |

### Git 관련
| 키맵 | 설명 |
|------|------|
| `<leader>gs` | Git 상태 |
| `<leader>gd` | Git diff |

### 탭 관리
| 키맵 | 설명 |
|------|------|
| `<leader><tab>l` | 마지막 탭 |
| `<leader><tab><tab>` | 새 탭 |
| `<leader><tab>]` | 다음 탭 |
| `<leader><tab>[` | 이전 탭 |
| `<leader><tab>d` | 탭 닫기 |

### 기타
| 키맵 | 설명 |
|------|------|
| `<leader>qq` | 전체 종료 |
| `<leader>uu` | UI 요소 토글 |
| `Space` | Which-key 메뉴 표시 |

## 🔧 사용자 정의 키맵

현재 설정에 포함된 추가 키맵:
- `<leader>fp`: 플러그인 파일 찾기 (Telescope)
- `<leader>co`: TypeScript import 정리
- `<leader>cR`: TypeScript 파일 이름 변경

## 💡 팁

- `Space`를 눌러 잠시 기다리면 사용 가능한 모든 키맵을 볼 수 있습니다 (Which-key)
- `<leader>sk`로 Telescope 키맵 검색기를 사용할 수 있습니다
- `lua/config/keymaps.lua` 파일에 개인 키맵을 추가할 수 있습니다

키맵 분류는 다음과 같이 구성되어 있습니다:
- `<leader>c` - 코드 관련
- `<leader>d` - 디버그
- `<leader>f` - 파일/찾기
- `<leader>g` - git
- `<leader>s` - 검색
- `<leader>u` - UI
- `<leader>w` - 윈도우
- `<leader>x` - 진단/quickfix
- `<leader><tab>` - 탭
