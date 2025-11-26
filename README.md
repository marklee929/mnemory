# Mnemory

## 오프라인 Flutter 샌드박스 (`SRC/mnemory-app`)
`SRC/mnemory-app` 워크스페이스를 사용하면 Firebase나 Functions 코드에 접근하지 않고도 Mnemory UI 데모를 실행할 수 있습니다. 모든 화면은 Figma 스타터 킷의 로컬 에셋으로 렌더링되므로 디자이너가 기기나 시뮬레이터에서 플로우를 직접 검토할 수 있습니다.

### 사전 준비물
- Flutter 3.24 이상 / Dart 3.4 이상
- (선택) 도구 체인을 고정할 `fvm`, 추후 멀티 패키지를 연결할 계획이라면 `melos`

### 워크스페이스 초기화
1. `cd SRC/mnemory-app`
2. 폴더가 비어 있다면 다음 명령으로 기본 프로젝트를 한 번만 스캐폴딩합니다:
   ```bash
   flutter create . --platforms=android,ios,web --org com.mnemory --project-name mnemory
   flutter pub add flutter_svg google_fonts
   ```
3. 제공된 UI 에셋을 복사해 백엔드 없이도 데모를 실행할 수 있도록 합니다:
   - `DOC/Mnemory_Figma_Starter_Kit/mnemory_figma_kit/screens/*.svg` -> `assets/screens/`
   - `DOC/Mnemory_Figma_Starter_Kit/mnemory_figma_kit/components/icons/*.svg` -> `assets/icons/`
   - `assets/mock/` 폴더를 만들고 아래 예시 JSON처럼 표시하고 싶은 데이터를 추가합니다.
4. `pubspec.yaml`에 에셋 폴더를 선언합니다:
   ```yaml
   flutter:
     assets:
       - assets/screens/
       - assets/icons/
       - assets/mock/
   ```

### 최소 오프라인 상태
```json
[
  {"id": "mn-001", "title": "Daily Focus", "level": "Warm-up", "streak": 3},
  {"id": "mn-045", "title": "Grammar Boost", "level": "Core", "streak": 12}
]
```
위 JSON을 `lib/main.dart`에서 불러와 사용하세요. 프로토타입 단계라면 동기 로드나 간단한 `MockRepository`로도 충분하며, `SvgPicture.asset('assets/screens/01_home.svg')`로 제공된 SVG를 그릴 수 있습니다.

### 로컬 실행
```bash
flutter pub get
flutter run -d chrome   # 또는 ios / android
```
네트워크 호출은 필요 없습니다. 이 데모는 저장소에 포함된 정적 에셋만 사용합니다. 이후 실제 저장소나 서비스를 연결할 때 MockRepository를 실제 데이터 소스로 교체하더라도 동일한 위젯 계약을 유지해 QA가 오프라인 빌드를 계속 활용할 수 있도록 합니다.

### 샌드박스 반복 개선 로그 (2025-10-26)
- 오프라인 앱 전체(스플래시, AppBar, 내비게이션, 중앙 히어로)에서 `assets/logo-transparent.png`를 사용해 올화이트 무드를 유지합니다.
- 스플래시는 5초 체류 시간을 보장하며, 목업 데이터를 로드한 뒤 항상 `/home`으로 이동합니다.
- 하단 내비게이션은 Home/Topics/Chat 세 탭으로 단순화했고, Home 탭은 로고 아이콘만 노출하며 라벨은 숨겼습니다.
- 홈 화면은 최신 목업을 반영합니다. 난이도/주기 선택 칩을 상단에 배치하고, “무엇을 배우고 싶으신가요?” 블록을 중앙 정렬했으며 입력 필드는 70% 폭에 CTA를 인라인으로 배치했습니다.
- 테마(`lib/app/theme.dart`)는 모든 배경을 `Colors.white`로 강제해 보라색 시드 컬러가 배경에 스며들지 않도록 합니다.
- 샌드박스를 실행하려면 `assets/mock/` JSON과 `assets/logo-transparent.png`가 필요합니다. 더 풍부한 목업이 필요하면 `assets/screens/`와 `assets/icons/`에 SVG를 추가하세요.

> 새 반복을 시작하기 전에 `flutter clean && flutter pub get`을 실행한 뒤 `flutter run -d chrome --no-resident`로 빌드하고, Chrome에서는 Ctrl+Shift+R로 하드 리프레시해 서비스 워커 캐시를 제거하세요.
AI가 생성한 **100~300자 학습 카드**를 **플러터 기반 집중 학습 경험**으로 제공하는 실험용 MVP입니다.

- **클라이언트**: Flutter (iOS/Android)
- **백엔드**: Firebase (Auth, Firestore, Functions, FCM)
- **AI**: OpenAI Responses API (요약 카드 생성, 튜터 챗봇)
- **핵심 KPI**: **게스트 모드 유지율(로그인 없이 24시간/하루 3회)**, 카드 완주율(최소 3장), 반복 학습 세션(Repeat/Variation)

---

## 주요 딜리버블

- **과제 입력-카드 생성까지 10초 내 응답** 유지(로딩 스피너 포함)
- **카드 가독성(Ease)**을 위한 줄 간격·패딩 프리셋(SR 루브릭) 적용
- **세션 테스트**: 10문항 이하 퀴즈, 변수 조합 스크립트, 응답 로그 확보
- **게스트 모드 리텐션**: 로그인 없이 24시간/하루 3회 사용 + 재방문 알림
- **운영 자동화(사후)**: 질문·카드 템플릿, PDF 리포트, CSV 내보내기

---

## 레포 구조 안내

```text
mnemory/
  app/                    # Flutter 클라이언트
    lib/
      app/                # 테마, 라우터, 의존성 주입
      core/               # 모델, 리포지터리 인터페이스
      features/           # onboarding, topics, routine_setup, card_view, weekly_test, progress, settings
      mock/               # MockRepository와 샘플 UI 시나리오
    pubspec.yaml

  functions/              # Firebase Cloud Functions (Node 20+ / TypeScript)
    src/
      openai.ts           # OpenAI Responses API 연동
      generateCard.ts     # 카드 생성 로직
      scheduling.ts       # 리마인더 생성·예약
      sendPush.ts         # FCM 발송
      adjustSpacing.ts    # 카드 레이아웃 보정
      guest.ts            # 게스트 세션 등록·만료(TTL)
    index.ts              # 함수 엔트리포인트
    package.json
    .runtimeconfig.sample.json

  firestore.rules         # 보안 규칙 초안
  firestore.indexes.json

  docs/
    architecture.md       # 시스템 구조 및 설계 메모
    api.md                # 앱-백엔드 API 계약(요청/응답)
    roadmap.md

  tools/
    figma/                # Figma 내보내기와 브랜드 자산
    scripts/              # 자동화·검증 스크립트
```
*** End Patch
