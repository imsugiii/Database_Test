/*new book table 생성*/
CREATE TABLE newbook(
bookid number PRIMARY key,
bookname VARCHAR2(20) not null,
publisher VARCHAR2(20) UNIQUE,
price number DEFAULT 10000 CHECK(price>1000));

select * from newbook;

/*newcustomer table 생성*/
create table newcustomer(
custid number PRIMARY key,
name varchar2(20),
address varchar2(20),
phone varchar(30));

/*neworders table 생성*/
create table neworders(
orderid number,
custid number not null,
bookid number not null,
saleprice number,
orderdate date,
primary key (orderid),
FOREIGN key(custid) references newcustomer(custid) on delete cascade);

/*속성 추가*/
alter table newbook add isbn varchar2(13);

/*제약사항 변경*/
alter table newbook modify isbn number;

select * from newbook;
select * from newcustomer;
select * from neworders;

/*테이블 삭제*/
drop table newbook;

/*튜플 추가*/
insert into book(bookid,bookname,publisher,price)
values(11, '스포츠 의학', '한솔의학서적', 90000);

insert into book(bookid,bookname,publisher)
values(14, '스포츠 의학', '한솔의학서적');

insert into book(bookid,bookname,publisher,price)
select bookid, bookname,publisher,price
from Imported_book;


select * from book;

/*업데이트*/
update customer
set address='대한민국 부산'
where custid=5;

update  customer
set address=(select address
from customer
where name='김연아')
where name='박세리';

select * from customer;

/*튜플 삭제*/
delete from customer
where custid=5;

rollback;

