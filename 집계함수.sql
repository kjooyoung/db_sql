-- 집계함수 (통계)
-- select절에 집계함수가 있으면 다른 컬럼은 올 수 없다.
-- 단, group by에 사용된 컬럼은 select절에 올 수 있다.
select avg(salary), sum(salary)
from salaries
where emp_no = 10060;

select emp_no, avg(salary), sum(salary)
from salaries
group by emp_no;

select salary, from_date
from salaries
where salary ;

select *
from (select max(salary), min(salary)
from salaries where emp_no = 10060) a;


select emp_no, AVG(salary)
from salaries
where emp_no in (select emp_no from titles where title = 'Manager');

select count(*)
from titles
group by emp_no;

select emp_no, count(*)
from titles
group by emp_no;

select emp_no, avg(salary)
from salaries
group by emp_no
having avg(salary) > 50000;