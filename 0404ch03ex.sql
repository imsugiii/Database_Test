select *from book;
select *from orders;
select *from customer;
/*박지성이 구매한 도서의 출판사 수 */
select count(b.publisher)"출판사 수" from orders o,customer c,book b where c.custid=o.custid and c.name like '박지성' and b.bookid=o.bookid; 
/*박지성이 구매한 도서의 이름,가격,정가와 판매가격의 차이 price-saleprice*/ 
select b.bookname,b.price,o.saleprice,(b.price-o.saleprice)"정가와 판매가 차이" from orders o,customer c,book b where c.custid=o.custid and c.name like '박지성' and b.bookid=o.bookid;
/*박지성이 구매하지 않은 도서의 이름*/
select Distinct b.bookname from orders o,customer c,book b where not c.custid=o.custid and c.name like '박지성' and b.bookid=o.bookid;/*주문하지 않은 고객의 이름*/
/*주문하지 않은 고객의 이름*/
select c.name from customer c where c.custid not in (select Distinct o.custid from orders o);
/*주문 금액의 총액과 주문의 평균 금액*/
select sum(saleprice)"총합",avg(saleprice)"평균" from orders;
/*고객의 이름과 고객별 구매액*/
select name,sum(saleprice) from customer,orders where orders.custid=customer.custid group by name;
/*고객의 이름과 고객이 구매한 도서목록*/
select name,bookname from book,orders,customer where book.bookid=orders.bookid and orders.custid=customer.custid;
/*도서의 가격과 판매가격의 차이가 가장 많은 주문*/
select * from book,orders where book.bookid=orders.bookid and price-saleprice = (select max(price-saleprice) from book,orders where book.bookid = orders.bookid);
/*도서의 판매액 평균보다 자신의 구매액 평균이 더 높은 고객의 이름 */
select name,avg(saleprice) from customer,orders where customer.custid=orders.custid group by name having avg(saleprice)>(select avg(saleprice) from orders); 