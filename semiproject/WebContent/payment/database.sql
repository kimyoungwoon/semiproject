CREATE USER team IDENTIFIED BY a123
DEFAULT TABLESPACE USERS
TEMPORARY TABLESPACE TEMP;

GRANT CONNECT,RESOURCE,UNLIMITED TABLESPACE TO team;

CREATE TABLE member (
  num number PRIMARY KEY,
  id varchar2(20) unique,
  pw varchar2(20),
  name varchar2(30),
  email varchar2(30),
  address varchar2(30),
  tel varchar2(30),
  gender varchar2(30),
  birth date,
  ipaddr varchar2(20)
);

CREATE TABLE writing (
  membernum number(20),
  num number(20) PRIMARY key,
  id varchar2(20),
  pw varchar2(20),
  name varchar2(30),
  email varchar2(30),
  hitCount varchar2(30),
  subject varchar2(30),
  content varchar2(4000),
  savePath date
);


CREATE TABLE product (
  num number(20) PRIMARY KEY,
  name varchar2(50),
  price number(20),
  category number(20),
  brand number(20),
  savefilename varchar2(50) not null,
  savefilename1 varchar2(50),
  savefilename2 varchar2(50),
  savefilename3 varchar2(50),
  savefilename4 varchar2(50)
);



CREATE TABLE REVIEW (
num number(20) PRIMARY key,
name varchar2(20),
subject varchar2(30),
content varchar2(4000),
saveFileName varchar2(50),
savePath date
);


CREATE TABLE category (
  num number(5),
  name varchar2(30)
);


CREATE TABLE brand (
  name varchar2(30),
  num number(20)
);


CREATE TABLE psize (
  name varchar2(30),
  num number(20)
);


CREATE TABLE color (
  name varchar2(30),
  num number(20)
);


CREATE TABLE tag (
  name varchar2(30),
  num number(20)
);


CREATE TABLE cart_product (
  membernum number(20),
  productnum number(20),
  count number(20)
);

CREATE TABLE order_history (
  membernum number(20),
  ordernum number(20),
  paymentcost number(20),
  orderdate date
);

CREATE TABLE order_detail (
  membernum number(20),
  ordernum number(20),
  productnum number(20),
  count number(20)
);

CREATE TABLE product_size (
  productnum number(20),
  sizeNum number(20)
);


CREATE TABLE product_color (
  productnum number(20),
  colorNum number(20)
);


CREATE TABLE product_tag (
  productnum number(20),
  tagNum number(20)
);


ALTER TABLE writing ADD FOREIGN KEY (membernum) REFERENCES member (num);

ALTER TABLE cart_product ADD FOREIGN KEY (productnum) REFERENCES product (num);

ALTER TABLE cart_product ADD FOREIGN KEY (membernum) REFERENCES member (num);

-- ALTER TABLE product ADD unique (pro_size);

ALTER TABLE psize ADD unique (num);

ALTER TABLE product_size ADD FOREIGN KEY (productnum) REFERENCES product (pro_size);

ALTER TABLE product_size ADD FOREIGN KEY (sizeNum) REFERENCES psize (num);

-- ALTER TABLE product ADD unique (COLOR);

ALTER TABLE color ADD unique (num);

ALTER TABLE product_color ADD FOREIGN KEY (productnum) REFERENCES product (color);

ALTER TABLE product_color ADD FOREIGN KEY (colorNum) REFERENCES color (num);


-- ALTER TABLE product ADD unique (tag);

ALTER TABLE tag ADD unique (num);


ALTER TABLE product_tag ADD FOREIGN KEY (productnum) REFERENCES product (tag);

ALTER TABLE product_tag ADD FOREIGN KEY (tagNum) REFERENCES tag (num);

