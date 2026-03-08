-- communication_votes 테이블 수정
-- created_at 컬럼 제거하고 likes_count, dislikes_count 컬럼 추가

USE project;

-- 1. created_at 컬럼 제거 (있으면)
ALTER TABLE communication_votes DROP COLUMN IF EXISTS created_at;

-- 2. likes_count 컬럼 추가 (없으면)
ALTER TABLE communication_votes 
ADD COLUMN IF NOT EXISTS likes_count INT DEFAULT 0 COMMENT '좋아요 개수';

-- 3. dislikes_count 컬럼 추가 (없으면)
ALTER TABLE communication_votes 
ADD COLUMN IF NOT EXISTS dislikes_count INT DEFAULT 0 COMMENT '싫어요 개수';

-- IF NOT EXISTS가 지원되지 않으면 아래 쿼리 사용:
-- ALTER TABLE communication_votes ADD COLUMN likes_count INT DEFAULT 0 COMMENT '좋아요 개수';
-- ALTER TABLE communication_votes ADD COLUMN dislikes_count INT DEFAULT 0 COMMENT '싫어요 개수';
