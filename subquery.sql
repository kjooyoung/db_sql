-- subquery
-- 단일행인 경우
-- < > = !
select a.emp_no, concat(a.first_name, ' ', a.last_name) as name
from employees a, dept_emp b
where a.emp_no = b.emp_no
and b.dept_no = (select b.dept_no from employees a, dept_emp b
				where a.emp_no = b.emp_no
				and concat(a.first_name, ' ', a.last_name) like 'Fai Bale');
                

select concat(a.first_name, ' ', a.last_name), b.salary
from employees a, salaries b
where a.emp_no = b.emp_no
and b.to_date = '9999-01-01'
and b.salary < (select avg(salary) from salaries
				where to_date = '9999-01-01')
order by b.salary desc;


select title, min(avg_salary)
from (select b.title, avg(a.salary) as avg_salary
from salaries a, titles b, employees c
where a.emp_no = c.emp_no
and b.emp_no = c.emp_no
and a.to_date = '9999-01-01'
and b.to_date = '9999-01-01'
group by b.title) a;

-- 다중행
-- any
-- = any (in 완전 동일), >any, <any, <>any, <=any, >=any
-- all
-- >all, <all, <>all, <=all, >=all

-- ex)현재 급여가 50000 이상인 직원 이름 출력
select concat(a.first_name,' ',a.last_name) as name, b.salary
from employees a, salaries b
where a.emp_no = b.emp_no
and b.to_date = '9999-01-01'
and a.emp_no in (select emp_no from salaries where to_date = '9999-01-01'
				and salary >= 50000);

select concat(a.first_name,' ',a.last_name) as name, b.salary
from (select emp_no, salary from salaries where to_date = '9999-01-01'
				and salary >= 50000) b, employees a
where b.emp_no = a.emp_no;