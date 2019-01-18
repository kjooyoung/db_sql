drop table member;

create table member(
	no int unsigned not null,
    email varchar(50) not null,
    password varchar(20) not null,
    name varchar(20),
    department_name varchar(20) not null default ' ', 
    primary key(no)
);

desc member;

-- 칼럼 추가
alter table member add column juminbunho char(13) not null;
alter table member drop column juminbunho;

-- 테이블의 컬럼 순서중 첫번째로 추가할 때
alter table member add column juminbunho char(13) not null first;

-- 테이틀의 컬럼 순서를 선택해서 추가할 때
alter table member add column juminbunho char(13) not null after name;


alter table member add column join_date  datetime not null;

-- change
alter table member change no no int unsigned not null auto_increment;

alter table member change department_name dept_name varchar(20) not null default 'none';


alter table member rename user;

desc user;

-- foreign key constraint(제약조건 : 데이터의 생성, 삭제, 수정에 제약을 건다)
create table dept(
	no int unsigned not null auto_increment,
    name varchar(50) not null,
    primary key(no)
);

desc dept_name;

drop table user;

create table user(
	no int unsigned not null auto_increment,
    email varchar(50) not null,
    password varchar(64) not null,
    name varchar(20),
    juminbunho char(13) not null,
    join_date  datetime not null,
    dept_no int unsigned,
    
    primary key(no),
    foreign key(dept_no) references dept(no) on delete set null -- (restrict, set null, cascade)
);
insert into dept(name) values('개발팀');

insert into user
values(null, 'a@a.com', password('1234'), '둘리', '', now(), 1)