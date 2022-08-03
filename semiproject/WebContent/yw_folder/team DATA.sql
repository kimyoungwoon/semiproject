insert into product (num, name, price) values(1, '트렌치코트', 530000);
insert into product (num, name, price) values(2, '린넨 가디건', 880000);
insert into product (num, name, price) values(3, '세미 정장', 300000);
insert into product (num, name, price) values(4, '물방울 원피스', 53000);
insert into product (num, name, price) values(5, '롱패딩', 102000);

select * from tab;

desc product;

desc member;

desc CART_PRODUCT;

insert into member (num, name) values(1, '김영운');
insert into member (num, name) values(2, '안수언');
insert into member (num, name) values(3, '이동진');
insert into member (num, name) values(4, '윤다영');
insert into member (num, name) values(5, '정영진');

insert into CART_PRODUCT (membernum, productnum, count) values(1, 1, 2);
insert into CART_PRODUCT (membernum, productnum, count) values(1, 2, 1);
insert into CART_PRODUCT (membernum, productnum, count) values(1, 3, 1);
insert into CART_PRODUCT (membernum, productnum, count) values(2, 2, 1);
insert into CART_PRODUCT (membernum, productnum, count) values(2, 3, 3);
insert into CART_PRODUCT (membernum, productnum, count) values(2, 4, 2);
insert into CART_PRODUCT (membernum, productnum, count) values(3, 1, 2);
insert into CART_PRODUCT (membernum, productnum, count) values(4, 3, 1);
insert into CART_PRODUCT (membernum, productnum, count) values(4, 4, 1);
insert into CART_PRODUCT (membernum, productnum, count) values(4, 5, 3);
insert into CART_PRODUCT (membernum, productnum, count) values(5, 1, 2);
insert into CART_PRODUCT (membernum, productnum, count) values(5, 3, 1);

select * from CART_PRODUCT;

commit;