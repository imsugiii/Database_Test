--202095085 정수현
--pg.199 / n.11 / 극장데이터베이스

CREATE TABLE 극장(
    극장번호 NUMBER primary key,
    극장이름 VARCHAR(20),
    위치 VARCHAR(10)
);
ALTER TABLE 극장 ADD CONSTRAINT emp_pk PRIMARY KEY (극장번호);
CREATE TABLE 상영관(
    극장번호 NUMBER not null,
    상영관번호 NUMBER,
    영화제목 VARCHAR(20),
    가격 NUMBER,
    좌석수 NUMBER,
    primary key(극장번호,상영관번호),
    foreign key(극장번호) REFERENCES 극장(극장번호) ON DELETE CASCADE
);
CREATE TABLE 예약(
    극장번호 NUMBER not null,
    상영관번호 NUMBER not null,
    고객번호 NUMBER not null,
    좌석번호 NUMBER,
    날짜 DATE,
    foreign key(극장번호,상영관번호) REFERENCES 상영관(극장번호,상영관번호) ON DELETE CASCADE,
    foreign key(고객번호) REFERENCES 고객(고객번호) ON DELETE CASCADE
);
CREATE TABLE 고객(
    고객번호 NUMBER primary key,
    이름 VARCHAR(10),
    주소 VARCHAR(10)
);

INSERT INTO 극장 VALUES(1, '롯데', '잠실');
INSERT INTO 극장 VALUES(2, '메가', '강남');
INSERT INTO 극장 VALUES(3, '대한', '잠실');

INSERT INTO 상영관 VALUES(1, 1, '어려운 영화', 15000, 48);
INSERT INTO 상영관 VALUES(3, 1, '멋진 영화', 7500, 120);
INSERT INTO 상영관 VALUES(3, 2, '재밋는 영화', 8000, 110);

INSERT INTO 예약 VALUES(3, 2, 3, 15, '2020-09-01');
INSERT INTO 예약 VALUES(3, 1, 4, 16, '2020-09-01');
INSERT INTO 예약 VALUES(1, 1, 9, 48, '2020-09-01');

INSERT INTO 고객 VALUES(3, '홍길동', '강남');
INSERT INTO 고객 VALUES(4, '김철수', '잠실');
INSERT INTO 고객 VALUES(9, '박영희', '강남');


select *from "극장";
select *from "고객"; 
select *from "상영관";
select *from "예약";


--1.모든 극장의 이름과 위치를 보이시오
SELECT 극장이름,위치 FROM 극장;
--2.잠실에 있는 극장을 보이시오
SELECT 극장이름 FROM 극장 WHERE 위치='잠실';
--3.잠실에 사는 고객의 이름을 오름차순으로 보이시오
SELECT 이름 FROM 고객 WHERE 주소= '잠실' ORDER BY 이름 DESC;
--4.가격이 8.000원이하인 영화의 극방번호,상영관 번호,영화제목을 보이시오
SELECT 극장번호,상영관번호,영화제목 FROM 상영관 WHERE 가격<=8000;
--5.극장위치와 고객의 주소가 같은 고객을 보이시오
SELECT * FROM 고객,극장 WHERE 고객.주소 = 극장.위치;

--1. 극장의 수는 몇개인가
SELECT COUNT(*) FROM  극장;
--2.상영되는 영화의 평균 가격은 얼마인가
SELECT AVG(가격) FROM 상영관;
--3.2020년 9월1일에 영화를 관람한 고객의 수는 얼마인가
SELECT COUNT(이름) FROM 예약,고객 WHERE 예약.고객번호=고객.고객번호 AND 날짜='20-09-01';

--1.'대한'극장에서 상영된 영화제목을 고르시오
SELECT 상영관.영화제목 FROM 상영관 , 극장 WHERE 극장.극장번호 = 상영관.극장번호 AND 극장이름 ='대한';

--2.대한 극장에서 영화를 본 고객의 이름을 보이시오
SELECT 고객.이름 FROM 극장,예약,고객 WHERE 극장.극장번호=예약.극장번호 AND 예약.고객번호=고객.고객번호 AND 극장이름 ='대한';

--3.대한 극장의 전체 수입을 보이시오
SELECT SUM(가격) FROM 상영관,극장,예약 WHERE 극장.극장번호 = 상영관.극장번호 AND 예약.상영관번호=상영관.상영관번호 AND 극장이름='대한';

--1.극장별 상영관수를 보이시오
SELECT 극장이름,COUNT(상영관번호) FROM 극장,상영관 WHERE 극장.극장번호 = 상영관.극장번호 GROUP BY 극장이름;

--2.'잠실'에있는 극장의 상영관을 보이시오
SELECT 상영관번호 FROM 극장 , 상영관 WHERE 극장.극장번호 = 상영관.극장번호 AND 극장.위치='잠실';
--3.2020-09-01일의 극장별 평균 관람 고객수를 보이시오
SELECT  AVG(COUNT(고객번호)) FROM 예약 WHERE 날짜='20-09-01' GROUP BY 고객번호;

--4.2020-09-01일의 가장 많은 고객이 관람한 영화를 보이시오
SELECT 영화제목 FROM 상영관
WHERE (극장번호, 상영관번호) IN (
  SELECT 극장번호, 상영관번호
  FROM 예약
  WHERE 날짜 = '2020-09-01'
)GROUP BY 영화제목
