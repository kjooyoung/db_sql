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


select b.title, avg(a.salary)
from salaries a, titles b
where a.emp_no = b.emp_no
and a.to_date = '9999-01-01'
and b.to_date = '9999-01-01'
group by b.title;

select title, min(salary)
from (select b.title, avg(a.salary) as salary
from salaries a, titles b
where a.emp_no = b.emp_no
and a.to_date = '9999-01-01'
and b.to_date = '9999-01-01'
group by b.title) a;
