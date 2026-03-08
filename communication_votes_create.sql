-- communication_votes 테이블 생성 (communication_reply_votes와 동일한 구조)
USE project;

-- 기존 테이블이 있으면 삭제 (선택사항)
-- DROP TABLE IF EXISTS communication_votes;

CREATE TABLE IF NOT EXISTS communication_votes (
  id INT AUTO_INCREMENT PRIMARY KEY,
  communication_id INT NOT NULL COMMENT '커뮤니티 글 ID',
  user_identifier VARCHAR(128) NOT NULL COMMENT '투표자 식별자',
  vote ENUM('like','dislike') NOT NULL COMMENT '투표 내용',
  created_at DATETIME NOT NULL COMMENT '투표 시간',
  UNIQUE KEY uq_comm_user (communication_id, user_identifier),
  KEY idx_comm (communication_id),
  CONSTRAINT fk_vote_communication
    FOREIGN KEY (communication_id) REFERENCES communications(id) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- communications 테이블에 likes_count, dislikes_count 컬럼 추가 (없으면)
ALTER TABLE communications ADD COLUMN IF NOT EXISTS likes_count INT DEFAULT 0 COMMENT '좋아요 개수';
ALTER TABLE communications ADD COLUMN IF NOT EXISTS dislikes_count INT DEFAULT 0 COMMENT '싫어요 개수';

-- IF NOT EXISTS가 지원되지 않으면:
-- ALTER TABLE communications ADD COLUMN likes_count INT DEFAULT 0 COMMENT '좋아요 개수';
-- ALTER TABLE communications ADD COLUMN dislikes_count INT DEFAULT 0 COMMENT '싫어요 개수';
