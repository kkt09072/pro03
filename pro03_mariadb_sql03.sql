show databases;

use morning;

show tables;

desc member;

insert into member(id, pw, name, email, tel) values ('admin', '1234', '관리자', 'admin@morning.com', '010-2848-1234');

select * from member where id='admin';

delete from member where id='admin';

commit;

desc free;

drop view ckboard;

create view ckboard as (select f.no as no, f.title as title, f.content as content, f.hits as hits,
f.resdate, m.id as id, m.name as name from free f, member m where f.id=m.id);

select * from ckboard;

commit;

select * from fileboard;

delete from fileboard where no=3;

select * from product;

delete from product where pno=3;

ALTER TABLE product AUTO_INCREMENT = 1;

-- ALTER TABLE product AUTO_INCREMENT = 1;

desc product;

desc inventory;

select p.pno as pno, p.cate as cate, p.pname as pname,
p.com as com, p.img as img, p.img2 as img2, p.img3 as img3,
avg(i.iprice) as iprice, max(i.oprice) as oprice,
sum(i.amount) as amount from product p, inventory i 
where p.pno=i.pno;

insert into inventory values (default, 1, 600, 900, 10, '', default);

drop view productvo;

create view productvo as (select p.pno as pno, p.cate as cate, p.pname as pname,
p.com as com, p.img as img, p.img2 as img2, p.img3 as img3,
avg(i.iprice) as iprice, max(i.oprice) as oprice,
sum(i.amount) as amount from product p, inventory i 
where p.pno=i.pno); 


drop view inventoryvo;

select i.ino as ino, i.pno as pno, p.pname as pname, 
avg(i.iprice) as iprice, 
max(i.oprice) as oprice, sum(i.amount) as amount, 
i.remark as remark, max(i.resdate) as resdate 
from inventory i, product p where i.pno=p.pno group by p.pno, i.pno;

create view inventoryvo as (select i.ino as ino, i.pno as pno, p.pname as pname, 
avg(i.iprice) as iprice, 
max(i.oprice) as oprice, sum(i.amount) as amount, 
i.remark as remark, max(i.resdate) as resdate 
from inventory i, product p where i.pno=p.pno group by p.pno, i.pno);

select * from productvo where pno=1;

select * from inventoryvo where pno=1;

alter table sales add gtid varchar(100);

alter table sales add rname varchar(100);

select * from sales;

select * from member;


