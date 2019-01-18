-- 서브쿼리(SUBQUERY) SQL 문제입니다.

-- 문제1.
-- 현재 평균 연봉보다 많은 월급을 받는 직원은 몇 명이나 있습니까?
select count(*)
from salaries
where to_date = '9999-01-01'
and salary > (select avg(salary) from salaries where to_date = '9999-01-01');

-- 문제2. 
-- 현재, 각 부서별로 최고의 급여를 받는 사원의 사번, 이름, 부서 연봉을 조회하세요. 단 조회결과는 연봉의 내림차순으로 정렬되어 나타나야 합니다. 
select emp_no, concat(first_name,' ',last_name), dept_name, salary
from ;

select d.dept_no, a.emp_no, max(b.salary)
from employees a, salaries b, dept_emp c, departments d
where a.emp_no = b.emp_no
and a.emp_no = c.emp_no
and c.dept_no = d.dept_no
and b.to_date = '9999-01-01'
group by d.dept_no;

-- 문제3.
-- 현재, 자신의 부서 평균 급여보다 연봉(salary)이 많은 사원의 사번, 이름과 연봉을 조회하세요 
select d.dept_no, b.emp_no, concat(b.first_name,' ',b.last_name), c.salary
from(select c.dept_no as dept_no, avg(b.salary) as avg_salary
	from employees a, salaries b, dept_emp c
	where a.emp_no = b.emp_no
	and a.emp_no = c.emp_no
	and b.to_date = '9999-01-01'
	and c.to_date = '9999-01-01'
	group by c.dept_no)a, employees b, salaries c, dept_emp d
where a.dept_no = d.dept_no 
and b.emp_no = d.emp_no
and b.emp_no = c.emp_no
and c.to_date = '9999-01-01'
and d.to_date = '9999-01-01'
and c.salary > a.avg_salary;

-- 문제4.
-- 현재, 사원들의 사번, 이름, 매니저 이름, 부서 이름으로 출력해 보세요.
select b.emp_no, concat(b.first_name,' ',b.last_name), a.name, a.dept_name
from( select c.dept_no as dept_no, c.dept_name as dept_name, b.emp_no as emp_no, 
			concat(a.first_name,' ',a.last_name) as name
		from employees a, dept_manager b, departments c
		where a.emp_no = b.emp_no
        and b.dept_no = c.dept_no
        and b.to_date = '9999-01-01')a, employees b, dept_emp c
where a.dept_no = c.dept_no
and b.emp_no = c.emp_no
and c.to_date = '9999-01-01'
order by b.emp_no;


-- 문제5.
-- 현재, 평균연봉이 가장 높은 부서의 사원들의 사번, 이름, 직책, 연봉을 조회하고 연봉 순으로 출력하세요.
select a.emp_no, concat(a.first_name,' ',a.last_name) as name,
		c.title, b.salary
from employees a, salaries b, titles c, dept_emp d
where a.emp_no = b.emp_no
and a.emp_no = c.emp_no
and a.emp_no = d.emp_no
and b.to_date = '9999-01-01'
and c.to_date = '9999-01-01'
and d.to_date = '9999-01-01'
and d.dept_no = (select dept_no
					from employees a, salaries b, dept_emp c
					where a.emp_no = b.emp_no
					and a.emp_no = c.emp_no
					and b.to_date = '9999-01-01'
					and c.to_date = '9999-01-01'
					group by dept_no
					order by avg(b.salary) desc
					limit 0,1)
order by b.salary;

-- 문제6.
-- 평균 연봉이 가장 높은 부서는? 
select dept_name
from departments
where dept_no = (select dept_no
				from employees a, salaries b, dept_emp c
				where a.emp_no = b.emp_no
				and a.emp_no = c.emp_no
				and b.to_date = '9999-01-01'
				and c.to_date = '9999-01-01'
				group by dept_no
				order by avg(b.salary) desc
				limit 0,1);
                
-- 문제7.
-- 평균 연봉이 가장 높은 직책?


select a.title
from (select title, avg(salary) as avg_salary
		from employees a, titles b, salaries c
		where a.emp_no = b.emp_no
		and a.emp_no = c.emp_no
		and b.to_date = '9999-01-01'
		and c.to_date = '9999-01-01'
		group by title) a
having a.avg_salary = max(a.avg_salary);
-- 문제8.
-- 현재 자신의 매니저보다 높은 연봉을 받고 있는 직원은?
-- 부서이름, 사원이름, 연봉, 매니저 이름, 메니저 연봉 순으로 출력합니다.
select a.emp_no, c.dept_no, b.salary
from employees a, salaries b, dept_manager c
where a.emp_no = b.emp_no
and a.emp_no = c.emp_no
and b.to_date = '9999-01-01'
and c.to_date = '9999-01-01';

select dept_name, concat(a.first_name,' ',a.last_name) as name;


