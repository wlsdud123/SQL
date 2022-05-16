--equi join 106개 --> null은 포함되지 않는다.

select e.first_name,
       e.department_id,
       d.department_name,
       d.department_id
from employees  e,  departments d
where e.department_id = d.department_id(+);

--left join 107개

select e.first_name,
       e.department_id,
       d.department_name,
       d.department_id
from employees  e left outer join departments d
on e.department_id = d.department_id;

--right join

select e.first_name,
       e.department_id,
       d.department_name,
       d.department_id
from employees  e right outer join  departments d
on e.department_id(+) = d.department_id;

--
select e.first_name,
       e.department_id,
       d.department_name,
       d.department_id
from departments d  right outer join  employees  e
on e.department_id = d.department_id;

--full outer join
select e.first_name,
       e.department_id,
       d.department_name,
       d.department_id
from departments d  full outer join  employees  e
on e.department_id = d.department_id;

/********************
*SubQuery
*****************************/


--'Den' 보다 급여를 많은받은 사람의 이름과 급여는 ?
select first_name,
       salary
from employees
where first_name = 'Den';        --11000

select first_name,
       salary
from employees
where salary >= 11000
order by salary asc;

select first_name,
       salary
from employees
where salary >= (select salary
                    from employees  
                    where first_name = 'Den')
                    
--급여를 가장 적게 받는 사람의 이름, 급여, 사원번호는 ?
select  first_name,
        salary,
        employee_id
from employees
where salary = (select  min(salary) 
                from employees);
                
--가장 작은 급여를 구한다
select  min(salary) 
from employees);

--평균 급여보다 적게 받는 사람의 이름. 급여를 출력하세요
select first_name,
       salary
from employees
where salary <= (select avg(salary)    --평균 급여
                 from employees);
                     
--평균급여
select avg(salary)
from employees;

--?? 부서번호가 100인 직원의 급여와 같은 모든 직원의 사번,이름,급여를 출력하시오
--110 12008
--110 8300


select first_name,
       salary,
       employee_id
from employees
where salary in (select salary   --평균 급여
                 from employees
                 where department_id = 110);

