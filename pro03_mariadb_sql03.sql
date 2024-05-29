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

delete from fileboard where no=1;

select * from product;

desc product;


