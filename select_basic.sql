-- column heading alias
select emp_no as '번호', first_name as '이름', hire_date as '고용일'
from employees;

-- concat column의 값을 합친 것
select emp_no as '번호', concat(first_name, ' ', last_name) as '이름', hire_date as '입사일'
from employees;

-- distinct 중복 제거
select distinct title from titles;

select concat(first_name, '', last_name) as '이름', gender, hire_date
from employees
order by hire_date asc;

select emp_no, salary from m salaries
where '2000-12-31' < from_date
and from_date < '2002-01-10'
order by salary desc;

select first_name, gender, hire_date
from employees
where hire_date < '1991-01-01';

select first_name, gender, hire_date
from employees
where hire_date < '1989-01-01'
and gender = 'f';

select *
from dept_emp
where dept_no in ('d005', 'd009');

select first_name, gender, hire_date
from employees
where hire_date like '1989-%';
