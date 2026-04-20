# SuperPM Skills

**한국 PM 가상 8인 팀** — Claude Code용 Role 기반 Skills 컬렉션.

PRD부터 위기 대응까지, 한 명의 PM이 혼자 감당해야 하는 역할 전부를 8개의
Skill로 나눠 Claude Code에 설치합니다. "PRD 써줘"라고 하면 `pm-writer`가
응답하고, "출시 준비"라고 하면 `launch-week` 시나리오가 여러 Role을 순서대로
호출합니다.

## 요구사항

- [Claude Code](https://docs.anthropic.com/en/docs/claude-code) 설치됨
- [Git](https://git-scm.com/) 설치됨
- macOS / Linux (Windows는 WSL 권장)

## 설치

```bash
git clone https://github.com/jinjin1/superpm-skills.git ~/.claude/skills/superpm
cd ~/.claude/skills/superpm
./setup.sh
```

설치 후 Claude Code를 재시작하고 아래를 시도해보세요:

```
PRD 써줘
포스트모템 정리해줘
임원용 1-pager 만들어줘
```

## 무엇이 들어있나

### 8 Roles (가상 PM 팀원)

| Role | 인격 | 담당 |
|---|---|---|
| `pm-writer` | 라이터 | PRD · 1-pager · RFC · 런치 노트 · 포스트모템 · 결정 메모 |
| `pm-strategist` | 전략가 | 시장·경쟁 분석 · OKR · 분기 전략 · 피벗 결정 |
| `pm-researcher` | 리서처 | 인터뷰 설계 · JTBD · 합성 · 페르소나 |
| `pm-analyst` | 분석가 | 퍼널·리텐션 · 코호트 · 실험 설계 |
| `pm-critic` | 반론자 | 전제 도전 · 스코프 컷 · 리스크 맵 |
| `pm-communicator` | 소통가 | 경영진 보고 · 스테이크홀더 조율 · 고객 에스컬레이션 |
| `pm-operator` | 오퍼레이터 | 런치 · 위기 대응 · 장애 회고 |
| `pm-coach` | 코치 | PM 면접 · 커리어 · 역량 진단 |

### 8 Scenarios (상황별 세션)

여러 Role을 순서대로 불러 하나의 상황을 처리.

- `launch-week` — 출시 주간 (strategist · writer · communicator · operator)
- `discovery-sprint` — 1주 디스커버리 (researcher · strategist · analyst)
- `growth-pause` — 성장 정체 진단 (analyst · researcher · strategist)
- `quarterly-cycle` — 분기말/분기초 의식 (strategist · analyst · communicator)
- `crisis-mode` — 장애·PR 위기 (operator · communicator · critic)
- `interview-season` — 구직 주간 (coach · writer · critic)
- `new-role-onboarding` — 새 PM 30일 (writer · communicator · strategist)
- `board-prep` — 이사회 준비 (strategist · analyst · writer · communicator)

## 철학

[`ETHOS.md`](./ETHOS.md)에 한국 PM 가상팀의 가치관이 정리되어 있습니다.
모든 Skill이 이 철학을 공유합니다.

## 업데이트

```bash
cd ~/.claude/skills/superpm
git pull
```

## 개발자용

이 레포는 SuperPM(https://superpm.app) 웹앱과 **분리된** 콘텐츠 레포입니다.
웹앱은 이 레포를 git submodule로 포함하여 `/roles/[slug]`, `/scenarios/[slug]`
페이지를 렌더합니다.

- 웹앱 레포: https://github.com/jinjin1/prompt
- 이 레포: https://github.com/jinjin1/superpm-skills
- 전략 문서: [`docs/designs/pm-harness-v1.md`](https://github.com/jinjin1/prompt/blob/main/docs/designs/pm-harness-v1.md) (웹앱 레포)

## 라이선스

MIT. [`LICENSE`](./LICENSE) 참조.
