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

insert into member (num,id,pw,name,email,address,tel,gender,birth,ipaddr) values(1, 'prettier','11','김영운', 'bHphHq7y@outlook.com','경기도','01089565417','M','1968-03-02','225.232.255.172');
insert into member (num,id,pw,name,email,address,tel,gender,birth,ipaddr) values(2, 'crlf11','11','안수언', 'G7nh7@dreamwiz.com','전라도','01018785101','M','1998-01-16','111.122.182.212');
insert into member (num,id,pw,name,email,address,tel,gender,birth,ipaddr) values(3, 'utffe3','11','이동진', 'd8jgpj@lycos.co.kr','충청도','01081245687','M','2002-11-05','123.214.178.212');
insert into member (num,id,pw,name,email,address,tel,gender,birth,ipaddr) values(4, 'procceed3','11','윤다영', 'EhghcjrO@hotmail.com','강원도','01006731147','W','1978-02-08','188.182.192.202');
insert into member (num,id,pw,name,email,address,tel,gender,birth,ipaddr) values(5, 'checkout1','11','정영진', 'oGIs3kqg@intizen.com','제주도','01034360457','M','1991-04-30','164.012.001.102');
insert into member (num,id,pw,name,email,address,tel,gender,birth,ipaddr) values(6, 'applyapple','11','최재혁', 'Ktd0Kc6o@outlook.com','함경북도','01015340457','W','1958-07-25','136.200.098.034');
insert into member (num,id,pw,name,email,address,tel,gender,birth,ipaddr) values(7, 'discountplz1','11','쌍은지', 'vVt9i@nate.com','경상도','01017895312','M','1977-12-01','211.228.209.122');
insert into member (num,id,pw,name,email,address,tel,gender,birth,ipaddr) values(8, 'shopperkim5','11','오세라', 'A3U@empal.com','평안남도','01093419021','M','1988-05-15','216.164.132.098');
insert into member (num,id,pw,name,email,address,tel,gender,birth,ipaddr) values(9, 'inmemna3','11','김수지', '16jv73@dreamwiz.com','황해도','01016389661','N','2002-06-18','119.212.062.132');
insert into member (num,id,pw,name,email,address,tel,gender,birth,ipaddr) values(10,'trenchch123','11', '안시연', 'LXNGUrrpi@hanmir.com','서울','01057670457','N','2010-11-11','201.062.092.221');


insert into PRODUCT (num,name,price, category, brand, pro_size, color, tag, savefilename) values(1, '트렌치코트',1130000,8, 2,1,3,1,'225');
insert into PRODUCT (num,name,price, category, brand, pro_size, color, tag, savefilename) values(2, '린넨 가디건',230000,1, 5,4,3,8,'111');
insert into PRODUCT (num,name,price, category, brand, pro_size, color, tag, savefilename) values(3, '물방울 원피스',730000,1, 2,6,8,6,'122');
insert into PRODUCT (num,name,price, category, brand, pro_size, color, tag, savefilename) values(4, '세미 정장',130000,4, 6,6,3,8,'188');
insert into PRODUCT (num,name,price, category, brand, pro_size, color, tag, savefilename) values(5, '플리자켓',30000,7, 6,5,3,1,'164');
insert into PRODUCT (num,name,price, category, brand, pro_size, color, tag, savefilename) values(6, '롱패딩',530000,3, 8,6,3,1,'136');
insert into PRODUCT (num,name,price, category, brand, pro_size, color, tag, savefilename) values(7, '마원'  ,830000,2, 2,1,5,1,'211');
insert into PRODUCT (num,name,price, category, brand, pro_size, color, tag, savefilename) values(8, '더블하트 티셔츠',4830000,7, 8,1,4,1,'216');
insert into PRODUCT (num,name,price, category, brand, pro_size, color, tag, savefilename) values(9, '우영미 플라워 티셔츠',123000,1, 4,3,3,2,'119');
insert into PRODUCT (num,name,price, category, brand, pro_size, color, tag, savefilename) values(10,'리바이스 청바지',983000,4, 2,1,3,3,'201');
