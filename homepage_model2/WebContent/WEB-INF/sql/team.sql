DROP TABLE team;

CREATE TABLE teamInfo(
	teamno		number			not null,
	name		varchar(20)		not null,
	gender		varchar(10)		not null,
	phone		varchar(20)		not null,
	zipcode		varchar(6)		not	null,
	address1	varchar(200)	not null,
	address2	varchar(200)	not null,
	skill		varchar(100)	not null,
	hobby		varchar(100)	not null,
	filename	varchar(100)	default 'member.jpg', -- null 값이 들어가면 기본 사진을 넣는다.
	primary	key(teamno)
)

Selec

UPDATE teamInfo
set filename = 'ben.jpg'
where teamno = 1

SELECT * from teaminfo
-- SEQUENCE 객체 생성 
CREATE SEQUENCE team_seq
START WITH 1 
INCREMENT BY 1 
MINVALUE 0 
CACHE 100;

-- NVL은 max(teamno)을 0으로 치환해서 시작한다. (함수)
SELECT NVL(max(teamno),0)+1 FROM team 

----------------------------------------------------- CREATE --------------------------------------------
INSERT INTO teamInfo(teamno, name, gender, phone, zipcode, address1, address2, skill, hobby, filename)
VALUES((SELECT NVL(max(teamno),0)+1 FROM teamInfo ),
'김지포','남','010-1111-1111','10019','서울시 종로구 관철동','코아빌딩 5층,10층','Java,JSP,MVC','코딩하기','member.jpg'
)

----------------------------------------------------- READ --------------------------------------------
SELECT * FROM teamInfo

----------------------------------------------------- UPDATE --------------------------------------------
UPDATE teamInfo
SET
phone = '010-2222-2222',
zipcode = '12345',
address1 = '서울시 강남구 역삼동',
address2 = '어떤 집',
skill = 'SQL',
hobby = '데이터베이스쿼리짜기'
WHERE teamno = 1;


----------------------------------------------------- DELETE --------------------------------------------

DELETE FROM teamInfo
WHERE teamno = 1;

----------------------------------------------------- LIST --------------------------------------------
SELECT teamno, name, phone, skill, filename, r
FROM(
	SELECT teamno, name, phone, skill, filename, rownum r
	FROM(
		SELECT teamno, name, phone, skill, filename
		FROM teamInfo
		WHERE name LIKE '%김지%'
		ORDER BY teamno desc
		)
	)WHERE r >=6 and r <= 10;


SELECT COUNT(*) FROM TEAMINFO
WHERE name LIKE '%김지%'


