/*
select문
    select 절
    from 절
*/

--모든 컬럼 조회하기

select *
from employees;

--원하는 컬럼만 조회하기
select employee_id, first_name, last_name
from employees;

--예제)
--사원의이름(fisrt_name)과 전화번호 입사일 연봉을 출력하세요.
select first_name, phone_number, hire_date, salary
from employees;

--사원의 이름(first_name)과 성(last_name) 급여, 전화번호, 이메일 , 입사일을 출력하세요.
select first_name,
       last_name,
       salary,
       phone_number,
       hire_date,
       salary,
       email
from employees;


--출력할때 컬럼명 별명 사용하기

select first_name "이름",
       phone_number "전화번호",
       hire_date "입사일",
       salary "급여"
from employees;

--사원의 사원번호 이름(first_name) 성(last_name) 급여 전화번호 이메일 입사일로 표시되도록 출력하세요
select first_name as 이름,
       last_name 성,
       phone_number "hp",
       hire_date "입사일",
       email "이메일",
       salary "급여"
from employees;

--연결연산자(컬럼을 붙이기)
select first_name || last_name
from employees;

select first_name || '           ' || last_name
from employees;

select first_name || ' hire date is ' || hire_date 입사일
from employees;

--산술 연산자
select first_name,
       salary,
       salary*12 연봉,
       (salary+300)*12 
from employees;

select job_id
from employees;

--전체직원의 정보를 다음과 같이 출력하세요

select first_name || '-' || last_name,
       salary 급여,
       salary*12 연봉,
       (salary*12+5000) 연봉2
from employees;

select *
from employees;

/*where절*/
select first_name
from employees
where department_id = 10



select first_name,
       salary,
       salary*12
from employees
where salary*12 >= 15000;


select first_name,
       hire_date
from employees
where hire_date >= '07/01/01' ;


--조건이 2개이상 일때 

select first_name,
       salary
from employees
where salary >= 14000
and salary <= 17000;

--연봉이 14000 이하이거나 17000 이상인 사원의 이름과 연봉을 출력하세요
select first_name,
       salary
from employees
where salary <= 14000 
or salary >= 17000;

--입사일이 04/01/01에서 05/12/31 사이의 사원의 이름과 입사일을 출력하세요
select first_name,
       hire_date
from employees
where hire_date >= '04/01/01'
and hire_date <= '05/12/31'

--IN  연산자
select first_name,
       salary
from employees
where first_name in ('Neena' , 'Lex' , 'John');

--연봉이 2100,3100,4100,5100인 사원의 이름과 연봉을 구하시오

select first_name 이름,
       salary 연봉
from employees
where salary in ('2100' , '3100' , '4100' , '5100');

--연봉이 2100,3100,4100,5100인 사원의 이름과 연봉을 구하시오2
select first_name 이름,
       salary 연봉
from employees
where salary = '2100' 
or salary = '3100' 
or salary = '4100' 
or salary = '5100'


--Like연산자
select first_name,
       last_name,
       salary
from employees
where first_name like 'L%';

--이름에 am 을 포함한 사원의 이름과 연봉을 출력하세요
select first_name,
       salary
from employees
where first_name like '%am%';

--이름의 두번째 글자가 a 인 사원의 이름과 연봉을 출력하세요

select first_name,
       salary
from employees
where first_name like '_a%';

--이름의 네번째 글자가 a 인 사원의 이름을 출력하세요
select first_name
from employees
where first_name like '___a%';

-- 이름이 4글자인 사원중 끝에서 두번째 글자가 a인 사원의 이름을 출력하세요
select first_name
from employees
where first_name like '____' 
and first_name like '_a__';


select first_name,
       salary,
       commission_pct,
       salary*commission_pct
from employees
where salary BETWEEN 13000 AND 15000;


select first_name,
       salary,
       commission_pct,
       salary*commission_pct
from employees
where commission_pct is  null; -- not null

--커미션비율이 있는 사원의 이름과 연봉 커미션비율을 출력하세요

select first_name,
       salary,
       commission_pct
       
from employees
where commission_pct is not null;

---order by 절

select first_name,
       salary
              
from employees
order by salary desc; -- 내림차순 --- asc 오름차순

--조건있는 정렬
select first_name, 
       salary
              
from employees
where salary >= 9000
order by salary desc; 

-- 부서번호를 오름차순으로 정렬하고 부서번호, 급여, 이름을 출력하세요

select employee_id,
       salary,
       first_name,
       department_id
              
from employees
order by department_id asc;

--급여가 10000 이상인 직원의 이름 급여를 급여가 큰직원부터 출력하세요

select salary,
       first_name
              
from employees
where salary >= 10000
order by salary desc;

-- 부서번호를 오름차순으로 정렬하고 부서번호가 같으면 급여가 높은 사람부터 부서번호 급여 이름을 출력하세요

select department_id,
       salary,
       first_name
                     
from employees

order by department_id asc, salary desc;

--단일행 함수
--문자함수 - INITCAP(컬럼명)
--부서번호 100인 직원의 이메일주소와 부서번호를 출력하시오

select email,
       initcap(email),
       department_id
from employees
where department_id = 100;

--문자함수 - LOWER / UPPER (컬럼명)
select first_name,
       upper(first_name),
       lower(first_name)
from employees
 where department_id = 100;
 
 --문자함수 - SUBSTR(컬럼명, 시작위치, 글자수)
 
 select first_name,
      substr(first_name, 1 , 3),
      substr(first_name, 1 , 4)
     from employees
 where department_id = 100;