/****************
*Join
*****************/

select *
from employees,departments;

select employee_id,
        first_name,
        salary,
        department_name,
        employees.department_id
from employees, departments
where employees.department_id = departments.department_id;

select first_name,
        em.department_id, 
        department_name,
        de.department_id
from employees em, departments de
where em.department_id = de.department_id;

--모든 직원이름 , 부서이름 , 업무명 출력
select e.first_name,
       d.department_name,
       j.job_title,
       e.department_id,
       d.department_id,
       e.job_id,
       j.job_id

from   employees e, departments d, jobs j
where  e.departments_id = d.department_id
and e.job_id = j.job_id;






select count(*)
from employees e , departments d , jobs j