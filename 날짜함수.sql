-- 현재 날짜, 시간
select curdate(), current_date;
select curtime(), current_time;
select now(), sysdate();

-- now()는 쿼리가 실행될 때 시간으로 계속 유지됨.
-- sysdate()는 출력될 때마다 현재 시간으로 바뀜.
select emp_no, now() from employees;
select emp_no, sysdate() from employees;

-- 포맷팅
select first_name,
	date_format(hire_date, '%Y-%m-%d %h:%i:%s')
from employees;

-- 각 직원들에 대해 직원의 이름과 근무 개월 수를 출력하라
select first_name,
	concat(cast(period_diff(date_format(curdate(), '%Y%m'), 
				date_format(hire_date, '%Y%m')) as char), '개월')
from employees;

-- 입사 후, 6개월 뒤에 정규직으로 발령이 된다.
-- 발령날은 언제인가?
-- month, week, year, day
select first_name, hire_date,
	date_add(hire_date, interval 6 month)
from employees;

select date_add(
		cast('20120516' as date), interval 100 day);