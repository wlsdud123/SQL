select first_name,
       commission_pct,
       nvl(commission_pct, 0),
       nvl2(commission_pct, 100, 0)
from employees;

/*********************************
* 그룹함수
*********************************/
/*
select first_name,
       sum(salary)
from employees;
*/

--그룹함수 - count() 
select count(*),
       count(commission_pct), --commisson_pct 컬럼의 null 카운트에서 제외
       count(manager_id)
from employees;

select count(*)
from employees
where salary > 16000;

--그룹함수 -  sum() 
select sum(salary)
from employees;

--그룹함수 -  avg()
select avg(nvl(salary, 0))
from employees;

--그룹함수 -  max() / min()
select max(salary)
from employees;

--Group by 절
select  count(*),
        avg(salary)
from employees;


select department_id,
       avg(salary)
from employees
group by department_id
order by department_id asc;

select  department_id,
        sum(salary), -- department_id(부서별 평균)
        avg(salary), -- department_id(부서별 합계)
        count(salary) -- department_id(부서별 총 개수)
from employees
group by department_id, job_id
order by department_id asc;

--연봉(salary)의 합계가 20000 이상인 부서의 부서 번호와 , 인원수, 급여합계를 출력하세요
select department_id,
       count(*),
       sum(salary)
from employees
--where sum(salary) >= 20000 --where절에는 그룹함수를 쓸수없음
group by department_id;

select department_id,
       count(*),
       sum(salary)
from employees
having sum(salary) >= 20000
and sum(salary) <= 100000
and department_id = 90
group by department_id;

--CASE ~ END문
select  employee_id,
        first_name,
        job_id,
        salary,
            case when job_id = 'AC_ACCOUNT' then salary+salary*0.1
            when job_id = 'SA_REP' then salary+salary*0.2
            when job_id = 'ST_CLERK' then salary+salary*0.3
            
            END realSalary
from employees;

--DECODE문
select  employee_id,
        first_name,
        job_id,
        salary,
             DECODE( job_id, 'AC_ACCOUNT', salary + salary * 0.1,
            'SA_REP', salary + salary * 0.2,
            'ST_CLERK', salary + salary * 0.3,
            salary) bouns
   
from employees;
--직원의 이름, 부서, 팀을 출력하세요
--팀은 코드로 결정하며 부서코드가 10~50 이면 ‘A-TEAM’
--60~100이면 ‘B-TEAM’ 110~150이면 ‘C-TEAM’ 나머지는 ‘팀없음’ 으로 출력하세요.
select first_name 이름,
        department_id 부서코드,
        
        case when department_id <= 50 then 'A-TEAM'
             when department_id <= 100 then 'B-TEAM'
             when department_id <= 150 then 'C-TEAM'
             ELSE '팀없음'
             END 팀
from employees;