create database morning;

use morning;

drop table board;

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