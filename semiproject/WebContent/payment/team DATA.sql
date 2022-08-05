insert into product (num, name, price) values(9, '트렌치코트', 830000);
insert into product (num, name, price) values(10, '린넨 가디건', 180000);
insert into product (num, name, price) values(11, '세미 정장', 200000);
insert into product (num, name, price) values(12, '물방울 원피스', 73000);
insert into product (num, name, price) values(13, '롱패딩', 102000);

select * from tab;

desc product;

desc member;

desc CART_PRODUCT;

insert into member (num, name) values(1, '김영운');
insert into member (num, name) values(2, '안수언');
insert into member (num, name) values(3, '이동진');
insert into member (num, name) values(4, '윤다영');
insert into member (num, name) values(5, '정영진');

insert into CART_PRODUCT (membernum, productnum, count) values(1, 9, 2);
insert into CART_PRODUCT (membernum, productnum, count) values(1, 10, 1);
insert into CART_PRODUCT (membernum, productnum, count) values(1, 11, 1);
insert into CART_PRODUCT (membernum, productnum, count) values(2, 10, 1);
insert into CART_PRODUCT (membernum, productnum, count) values(2, 11, 3);
insert into CART_PRODUCT (membernum, productnum, count) values(2, 12, 2);
insert into CART_PRODUCT (membernum, productnum, count) values(3, 9, 2);
insert into CART_PRODUCT (membernum, productnum, count) values(4, 11, 1);
insert into CART_PRODUCT (membernum, productnum, count) values(4, 12, 1);
insert into CART_PRODUCT (membernum, productnum, count) values(4, 3, 3);
insert into CART_PRODUCT (membernum, productnum, count) values(5, 11, 2);
insert into CART_PRODUCT (membernum, productnum, count) values(5, 13, 1);

select * from CART_PRODUCT;

commit;

select h.membernum, h.ordernum, h.orderdate, d.productnum, d.count from order_history h, order_detail d 
where h.membernum = d.membernum and h.ordernum = d.ordernum;
