--테이블명:address
--컬럼명: no, name, phone, zipcode, address1,address2,wdate

DROP TABLE address

CREATE TABLE address(
	no			number		 	not null,		-- number기본은 18이다.
	name		varchar(20)		not null,
	phone		varchar(20)		not null,
	zipcode		varchar(6)		not null,
	address1	varchar(200)	not null,
	address2	varchar(200)	not null,
	wdate		date			not null,
	primary key(no)
)

--DML,DQL 작성
--c,r,u,d,list

-- NVL은 max(teamno)을 0으로 치환해서 시작한다. (함수)
SELECT NVL(max(no),0)+1 FROM address

--CREATE
INSERT INTO address(no, name, phone, zipcode, address1, address2, wdate)
VALUES ((SELECT NVL(max(no),0)+1 FROM address),'김지원','010-8555-1234','12345','경기도 김포시','마송',sysdate);

--READ
SELECT * FROM address

--UPDATE
UPDATE address SET phone='010-1234-1234', zipcode='11111', address1='서울특별시', address2='종로구'
WHERE no = 1;

--DELETE
DELETE FROM address WHERE no=1;

--LIST
SELECT no, name, phone, to_char(wdate, 'yyyy-mm-dd') wdate FROM address ORDER BY no DESC;

SELECT no, name, phone, to_char(wdate, 'yyyy-mm-dd') wdate, r
FROM(
	SELECT no, name, phone, wdate, rownum r
	FROM(
		SELECT no, name, phone, wdate
		FROM address
		ORDER BY no desc
		)
	)WHERE r >=1 and r <=5;
	
	
----total

SELECT COUNT(*) FROM address
WHERE name LIKE '%김지%'


