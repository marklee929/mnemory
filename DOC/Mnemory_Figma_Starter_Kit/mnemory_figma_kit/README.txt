# Mnemory — Figma Starter Kit
생성일: 2025-10-25 05:12

## 가져오는 방법
1) Figma에서 프로젝트 열기 → **File > Place Image** 로 `screens/*.svg`를 각각 배치하면 프레임으로 들어갑니다.
2) **Tokens Studio** 플러그인에서 `tokens/tokens.json`을 임포트하면 색/폰트/간격 토큰이 생성됩니다.
3) 아이콘은 `components/icons/` SVG를 컴포넌트로 등록해 재사용하세요.

## 포함된 화면
- 00_splash.svg — 로딩/스플래시
- 01_home.svg — 메인(설명 + 예시 학습 카드 + CTA)
- 02_chat.svg — 채팅
- 03~05_topics_level*.svg — 학습 목록(최대 3뎁스)
- 06_profile.svg — 내 정보/설정

## 디자인 토큰
- Primary: #5C47C3, Secondary: #3DC2C0, FG: #0D1B2A, Muted: #8AA0B2
- Radius: 6/12/20px, Spacing: 4/8/16/24/32px
- Font: Inter / Pretendard / Noto Sans KR

원하는 카피/컴포넌트 구조 알려주시면 바로 반영해 확장판을 만들어 드릴게요.

## Flutter static handoff (`SRC/mnemory-app`)
1. Copy `/screens/*.svg` -> `SRC/mnemory-app/assets/screens/` and `/components/icons/*.svg` -> `SRC/mnemory-app/assets/icons/`. Keep the filenames so widgets can refer to the exact states (00_splash, 01_home, ...).
2. Declare the folders plus `assets/mock/` inside the Flutter `pubspec.yaml` and add `flutter_svg` so the SVGs can be rendered without rasterizing in advance.
3. Drop any review data inside `assets/mock/` (for example `cards.json`, `topics.json`). The offline runner only needs lightweight arrays such as:
   ```
   [
     {"id":"topic-esp","title":"Beginner Spanish","level":"A1"},
     {"id":"topic-ai","title":"AI Literacy","level":"Core"}
   ]
   ```
4. In `lib/main.dart`, load the mock JSON with `rootBundle.loadString` and pair each state with the right screen asset (`SvgPicture.asset('assets/screens/02_chat.svg')`). This mirrors the exact flows shown in Figma while staying completely offline.
5. To keep snapshots in sync, re-export SVGs from Figma into this folder whenever components change, then re-run `flutter pub get && flutter run` from `SRC/mnemory-app`.
