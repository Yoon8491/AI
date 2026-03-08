# Vercel 환경 변수 설정 가이드

Vercel에 배포된 프론트엔드가 백엔드 서버와 정상적으로 통신하려면 다음 환경 변수를 설정해야 합니다.

## 필수 환경 변수

### 1. JWT_SECRET
- **설명**: JWT 토큰 서명용 비밀키 (프론트엔드와 백엔드가 동일한 값 사용)
- **값**: `manufacturing-dashboard-secret-change-in-production` (백엔드와 동일)
- **설정 위치**: Vercel Dashboard > Project Settings > Environment Variables

### 2. BACKEND_API_URL
- **설명**: 백엔드 서버 URL (Next.js API 라우트에서 사용)
- **값**: `http://3.34.166.82:4000`
- **설정 위치**: Vercel Dashboard > Project Settings > Environment Variables

### 3. 데이터베이스 연결 정보 (Next.js API 라우트에서 사용)
- `DB_HOST`: `localhost` (또는 실제 DB 호스트)
- `DB_PORT`: `3306`
- `DB_USER`: `root`
- `DB_PASSWORD`: `AZAZPROJECT` (실제 비밀번호로 변경)
- `DB_NAME`: `project`
- `AUTH_DB_HOST`: `localhost`
- `AUTH_DB_PORT`: `3306`
- `AUTH_DB_USER`: `root`
- `AUTH_DB_PASSWORD`: `AZAZPROJECT` (실제 비밀번호로 변경)
- `AUTH_DB_NAME`: `project`
- `PROCESS_DB_NAME`: `project`

## 설정 방법

1. Vercel Dashboard에 로그인
2. 프로젝트 선택
3. Settings > Environment Variables 이동
4. 위의 환경 변수들을 추가:
   - **Name**: 환경 변수 이름 (예: `JWT_SECRET`)
   - **Value**: 환경 변수 값 (예: `manufacturing-dashboard-secret-change-in-production`)
   - **Environment**: `Production`, `Preview`, `Development` 모두 선택 (또는 필요에 따라 선택)

## 중요 사항

- **JWT_SECRET**은 프론트엔드와 백엔드가 동일한 값을 사용해야 합니다. 그렇지 않으면 401 Unauthorized 오류가 발생합니다.
- **BACKEND_API_URL**은 백엔드 서버의 실제 주소를 사용해야 합니다. Vercel API 라우트는 이 주소로 프록시 요청을 보냅니다.
- 환경 변수를 변경한 후에는 **Redeploy**가 필요합니다.

## 문제 해결

### 401 Unauthorized 오류
- JWT_SECRET이 프론트엔드와 백엔드에서 동일한지 확인
- Vercel 환경 변수가 올바르게 설정되었는지 확인
- 환경 변수 변경 후 재배포했는지 확인

### Failed to fetch 오류
- BACKEND_API_URL이 올바르게 설정되었는지 확인
- 백엔드 서버가 실행 중인지 확인 (`http://3.34.166.82:4000`)
- 백엔드 서버의 CORS 설정이 Vercel 도메인을 허용하는지 확인
