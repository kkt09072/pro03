create database morning;

use morning;

-- board, member, free, fileboard, qna, product, inventory,
-- sales, basket

create table board(bno int auto_increment primary key, 
title varchar(200), content varchar(1000), 
author varchar(20) default 'admin',
vcnt int default 0, resdate timestamp default current_timestamp);

insert into board(title, content) values ('더미글 제목1', '더미글 내용1 입니다.');
insert into board(title, content) values ('더미글 제목2', '더미글 내용2 입니다.');
insert into board(title, content) values ('더미글 제목3', '더미글 내용3 입니다.');
insert into board(title, content) values ('더미글 제목4', '더미글 내용4 입니다.');
insert into board(title, content) values ('더미글 제목5', '더미글 내용5 입니다.');
insert into board(title, content) values ('더미글 제목6', '더미글 내용6 입니다.');

commit;

select * from board;

show tables;

create table member(id varchar(20) primary key,
pw varchar(300) not null, name varchar(100) not null,
email varchar(200) not null, tel varchar(100) not null,
addr1 varchar(200), addr2 varchar(100), postcode varchar(20),
birth date, point int default 1000, 
regdate timestamp default current_timestamp);

create table free(no int auto_increment primary key,
title varchar(200), content varchar(1000),
hits int default 0, resdate timestamp default current_timestamp,
id varchar(20), name varchar(100));

alter table free add constraint fk_mem 
foreign key (id) references member(id);

create table qna(no int auto_increment primary key,
title varchar(200), content varchar(1000),
lev int default 1, parno int default 0, 
hits int default 0, resdate timestamp default current_timestamp,
id varchar(20), name varchar(100));

alter table qna add constraint fk_mem0 
foreign key (id) references member(id);

create table fileboard(no int auto_increment primary key,
title varchar(200), content varchar(1000), url varchar(300),
hits int default 0, resdate timestamp default current_timestamp,
author varchar(20));

create table product(pno int auto_increment primary key,
cate varchar(20) not null, pname varchar(100) not null, 
com varchar(1000), price int default 1000, 
img varchar(300));

alter table product add img2 varchar(300);
alter table product add img3 varchar(300);

create table inventory(ino int auto_increment primary key,
pno int, iprice int default 1000, oprice int default 1000,
amount int default 1, remark varchar(200),
foreign key(pno) references product(pno)); 

alter table inventory add resdate timestamp default current_timestamp;

create table sales(sno int auto_increment primary key,
pno int, amount int default 1, tot int, id varchar(20),
paymethod varchar(20), paynum varchar(30), 
addr varchar(300), tel varchar(100), 
delcom varchar(50), deltel varchar(50), 
delno varchar(50), delstatus varchar(20), 
st varchar(20));

alter table sales add constraint fk_mem1 
foreign key (id) references member(id);

alter table sales add constraint fk_pro1 
foreign key (pno) references product(pno);

alter table sales add resdate timestamp default current_timestamp;

create table basket(bno int auto_increment primary key,
id varchar(20), pno int, amount int, remark varchar(100));

alter table basket add constraint fk_mem2 
foreign key (id) references member(id);

alter table basket add constraint fk_pro2 
foreign key (pno) references product(pno);

alter table basket add resdate timestamp default current_timestamp;

