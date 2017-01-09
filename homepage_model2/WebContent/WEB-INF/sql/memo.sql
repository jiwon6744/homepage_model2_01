-- 테이블 생성 
CREATE TABLE memo( 
  memono  NUMBER(6)     NOT NULL,  -- 일련번호, -999999 ~ +999999 
  title   VARCHAR(100)  NOT NULL,  -- 메모 제목, 한글 50자 
  content VARCHAR(4000) NOT NULL,  -- 내용  
  wdate   DATE          NOT NULL,  -- 등록 날짜  
  viewcnt NUMBER(5)     DEFAULT 0, -- 조회수, -99999 ~ +99999 -- NULL값이 들어가면 0으로 기본값이 들어갑니다.
  PRIMARY KEY(memono)              -- 고유한 값, 중복 안됨    
);
 
-- SEQUENCE 객체 생성 
CREATE SEQUENCE memo_seq
START WITH 1 
INCREMENT BY 1 
MINVALUE 0 
CACHE 100; 

--CREATE
INSERT INTO memo(memono, title, content, wdate)
VALUES (memo_seq.nextval, '오늘 오후 두시 회의', '내용은 홈페이지 작업관련', sysdate)

INSERT INTO memo(memono, title, content, wdate)
VALUES (memo_seq.nextval, '오늘 오후 세시 회의', '내용은 홈페이지 수정작업', sysdate)

INSERT INTO memo(memono, title, content, wdate) 
VALUES(memo_seq.nextval, '오늘의 메모', '이전주 토익 시험 준비', sysdate)

--READ
SELECT * FROM memo

SELECT * FROM memo
WHERE memono = 1

--UPDATE
UPDATE memo 
set 
title = '오늘 두시 회의 취소',
content = '다음주 화요일에 다시 회의'
WHERE memono = 1

--DELETE
DELETE FROM memo
WHERE memono = 1

--LIST
SELECT * FROM memo
ORDER BY memono DESC

SELECT memono, title, to_char(wdate, 'yyyy-mm-dd') FROM memo
ORDER BY memono DESC


SELECT memono, title, to_char(wdate, 'yyyy-mm-dd') wdate, viewcnt, r
FROM(
	SELECT memono, title, wdate, viewcnt, rownum r
	FROM(
		SELECT memono, title, wdate, viewcnt FROM memo
		ORDER BY memono DESC
		)
	)WHERE r >= 1 and r <= 5
	
SELECT COUNT(*) FROM memo
WHERE title LIKE '%화요일%'

SELECT * FROM memo



----------------------------------------------------------------------------------------------------
CREATE TABLE news(
  newsno INT          NOT NULL,
  title  VARCHAR(100) NOT NULL,
  media  VARCHAR(50)  NOT NULL,
  author VARCHAR(30)  NOT NULL,
  rdate  DATE         NOT NULL,
  PRIMARY KEY(newsno)
);
 
INSERT INTO news(newsno, title, media, author, rdate)
VALUES(1, 'MS, 2016년 구형 'IE' 브라우저 지원 중단', 'ZDNet', '가길동', sysdate);

INSERT INTO news(newsno, title, media, author, rdate)
VALUES(2, 'MS, 2016년 구형 "IE" 브라우저 지원 중단', 'ZDNet', '가길동', sysdate);
 
SELECT newsno, title, media, author, rdate FROM news;

DELETE FROM news;

ALTER SEQUENCE memo_seq INCREMENT BY -2

SELECT memo_seq.nextval from dual;

ALTER SEQUENCE memo_seq INCREMENT BY 1;