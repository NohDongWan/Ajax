drop table products;


create table products(
id number(11),
name varchar2(50),
modelnumber varchar2(15),
series varchar2(30)
)

select * from products


insert into products values(1,'핸드폰','노트9','갤럭시');

delete products


drop sequence products_sqe

create sequence products_seq
start with 2
increment by 1
nocache;