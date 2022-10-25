create table member(---테이블 만들기---
	id int not null auto_increment,
	name varchar(100)not null,
	passwd varchar(50)not null,
	primary key(id)
);

select * from member; ---테이블 확인---

show tables; ---테이블 확인---

desc member; ---가지고 있는 컬럼---


insert into member values(88,'홍길진','1238') ---정보입력//내가 번호입력해서 넣을수있음---
insert into member(name,passwd) values('홍길민','1239') ---정보입력//제일큰값뒤다음값으로 들어감---

select* from member where id = 88; ---id가 88인사람을 찾기 ---

select * from member order by passwd desc; ---패스워드로 정렬하기---

update member set name='뿡뿡뿡' where name = '홍길석'; ---업데이트---

delete from member where id = 1; ---삭제하기 ---

delete from member; ---전부삭제---