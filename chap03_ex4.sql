insert into book(bookid,bookname, publisher, price)
values (15,'스포츠세계', '대한미디어',10000);

delete from book
where publisher='삼성당';

delete from book
where publisher='이상미디어';

update  book
set publisher=(select publisher
from book
where publisher='대한미디어')
where publisher='대한출판사';

select * from book;
select * from bookcompany;

CREATE TABLE bookcompany(
name VARCHAR2(20) PRIMARY key ,
address VARCHAR2(20),
begin date);

alter table bookcompany add webaddress varchar2(30);

insert into bookcompany(name,address,begin,webaddress)
values('한빛아카데미','서울시 마포구', '1993-01-01', 'http://hanbit.co.kr');