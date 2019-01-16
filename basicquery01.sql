-- Basic Query 연습
drop table pet;

desc pet;

create table pet(
	name varchar(20),
    owner varchar(20),
    species varchar(20),
    gender char(1),
    birth date,
    death date
);

insert into pet values('마음이', '주영', 'dog', 'f', '2018-10-10', null);

SET SQL_SAFE_UPDATES = 0;

update pet set owner = '주영이'
where name like '마음이';

select name, owner from pet;

-- load data
load data local infile 'c:\\pet.txt' into table pet;

-- sql select
select * from pet;
select * from pet where name = 'Bowser';
select * from pet where birth > '1998-01-01';
select * from pet where species='dog' and gender='f';
select * from pet where species='snake' or species='bird';

select name, birth
from pet;

select name, gender, birth
from pet
order by gender asc, birth desc;

select * 
from pet
where gender is null;

select *
from pet
where gender is not null;

-- LIKE 검색
select *
from pet
where name like 'b____';

select *
from pet
where name like '%fy';

select *
from pet
where name like '%w%';

select *
from pet
where name like '_____';

select *
from pet
where length(name) = 5;

select count(*) as '총 애완동물 수'
from pet;

select owner, count(*) as '총 애완동물 수'
from pet
where death is null or death = '0000-00-00'
group by owner
having count(*) > 1;