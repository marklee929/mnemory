# Mnemory

## Offline Flutter sandbox (`SRC/mnemory-app`)
Use the `SRC/mnemory-app` workspace to boot a Mnemory UI demo without hitting Firebase or the Functions code. Everything is rendered with local assets from the Figma starter kit so designers can review the flows on a device or simulator.

### Prerequisites
- Flutter 3.24+ / Dart 3.4+
- (Optional) `fvm` to lock the toolchain, and `melos` if you later wire multiple packages

### Bootstrap the workspace
1. `cd SRC/mnemory-app`
2. If the folder is empty, scaffold the shell project once:
   ```bash
   flutter create . --platforms=android,ios,web --org com.mnemory --project-name mnemory
   flutter pub add flutter_svg google_fonts
   ```
3. Copy the provided UI assets so the demo can run without the backend:
   - `DOC/Mnemory_Figma_Starter_Kit/mnemory_figma_kit/screens/*.svg` -> `assets/screens/`
   - `DOC/Mnemory_Figma_Starter_Kit/mnemory_figma_kit/components/icons/*.svg` -> `assets/icons/`
   - Create `assets/mock/` and drop any JSON you want to surface (see the snippet below).
4. Declare the folders in `pubspec.yaml`:
   ```yaml
   flutter:
     assets:
       - assets/screens/
       - assets/icons/
       - assets/mock/
   ```

### Minimal offline state
```json
[
  {"id": "mn-001", "title": "Daily Focus", "level": "Warm-up", "streak": 3},
  {"id": "mn-045", "title": "Grammar Boost", "level": "Core", "streak": 12}
]
```
Load that JSON inside `lib/main.dart` (synchronously for prototypes or via a tiny `MockRepository`) and paint the provided SVGs using `SvgPicture.asset('assets/screens/01_home.svg')`.

### Run locally
```bash
flutter pub get
flutter run -d chrome   # or ios / android
```
No network calls are required - the demo only touches the static assets that ship with this repository. When you later connect the actual repositories/services, swap the mock repository with a real data source but keep the same widget contracts so QA can continue to rely on this offline build.

AI가 생성한 **100–300자 요약 카드**를 **스페이스드 리피티션** 리듬으로 보내 주는 “지능형 습관 학습기”.

- **클라이언트**: Flutter (iOS/Android)
- **백엔드**: Firebase (Auth, Firestore, Functions, FCM)
- **AI**: OpenAI Responses API (주제 요약 카드, 테스트 생성)
- **특징**: **게스트 체험 모드(로그인 없이 24시간 푸시 3회)**, 주제 트리(최대 3뎁스), 주간 테스트, 재학습(Repeat/Variation)

---

## ✨ 핵심 기능

- **주제 입력 → 카드 생성 → 푸시 루프** 자동화  
- **난이도 피드백(Ease)** 기반 간격 조정(SR 라이트)  
- **주간 테스트**(10문항, 객관식 중심) & 오답노트  
- **게스트 체험**: 로그인 없이 24시간/푸시 3회 체험 → 로그인 유도  
- **구독 플랜**(향후): 광고 제거, 트리 무제한, PDF 리포트 다운로드

---

## 🧱 레포 구조

mnemory/
app/ # Flutter 앱
lib/
app/ # theme, router, di
core/ # models, repo interfaces
features/ # onboarding, topics, routine_setup, card_view, weekly_test, progress, settings
mock/ # MockRepository(서버 없이 UI 동작)
pubspec.yaml

functions/ # Firebase Cloud Functions (Node 20+ / TypeScript)
src/
openai.ts # OpenAI Responses API 호출 래퍼
generateCard.ts # 카드 생성 로직
scheduling.ts # 슬롯 생성/푸시 스케줄
sendPush.ts # FCM 전송
adjustSpacing.ts # 피드백 기반 간격 조정
guest.ts # 게스트 세션 등록/만료(TTL)
index.ts # 함수 엔트리
package.json
.runtimeconfig.sample.json

firestore.rules # 보안 규칙(초안)
firestore.indexes.json

docs/
architecture.md # 시스템 아키텍처 & 시퀀스
api.md # 앱<->커넥터 API 계약(요청/응답)
roadmap.md

tools/
figma/ # Figma 스타터(스크린, 토큰, 아이콘)
scripts/ # 배포/검증 스크립트

