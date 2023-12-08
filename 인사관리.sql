desc departments;

select *
from employees;

select department_id, location_id
from departments;

select location_id, department_id -- ���̺� �ִ� Į���� ������ �ǹ̰�����.
from departments;

select department_id, department_id
from departments;

select last_name, salary, salary + 300
from employees;

select last_name, salary, 12*salary+100
from employees;

select last_name, salary, 12*(salary+100)
from employees;

select last_name, job_id, salary, commission_pct
from employees;

select last_name, 12*salary*commission_pct -- �� ���� �����ϴ� ������� �η� ��
from employees;

select last_name, 12*salary*NVL(commission_pct, 1)
from employees;

select last_name as name, commission_pct comm
from employees;

select last_name "Name" , salary*12 "Annual Salary"
from employees;

select last_name "�̸�" , salary*12 "���ʽ�"
from employees;

select last_name||job_id as "Employees"
from employees;

select last_name||' is a '||job_id as "Employees Details"
from employees;

select department_id
from employees;

select distinct department_id
from employees;

select distinct department_id, job_id -- distinct�� �ݵ�� select ������ �´�.
from employees;

desc departments;
select * from departments;

desc employees;
select employee_id, last_name, job_id, hire_date as startdate
from employees;

select distinct job_id
from employees;

desc employees;
select employee_id as "Emp #" , last_name as "Employee" , job_id as "Job", hire_date as "Hire Date"
from employees;

select job_id || ', ' || last_name as "Employee and Title"
from employees;

select employee_id, last_name, job_id, department_id
from employees
where department_id = 90;

select last_name, job_id, department_id
from employees
where last_name = 'Whalen'; -- 'whalen' �����ʹ� ��ҹ��� ������.

select last_name
from employees
where hire_date = '05/10/10';

select last_name, salary
from employees
where salary <= 3000;

select last_name, hire_date
from employees
where hire_date < '05/01/01';

select last_name, salary
from employees
where salary between 2500 and 3500;

select last_name, salary
from employees
where salary between 3500 and 2500; -- ���������� �������� ������ �������� �տ�!!

select employee_id, last_name, salary, manager_id
from employees
where manager_id in (100, 101, 201);

select first_name
from employees
where first_name like 'S%';

select last_name
from employees
where last_name like '%s';

select last_name, hire_date
from employees
where hire_date like '05%';

select last_name, hire_date
from employees
where last_name like '_o%';

select employee_id, last_name, job_id
from employees
where job_id like '%SA_%';

select employee_id, last_name, job_id
from employees
where job_id like '%SA3_%' escape '3'; -- ���� ����ٸ� ���� ���� ���� ����� �տ� ������ ���� �̽������� ������ ���´�.

select employee_id, last_name, job_id
from employees
where job_id like '%_M%';

select employee_id, last_name, job_id
from employees
where job_id like '%3_M%' escape '3';

select *
from employees
where commission_pct is null; -- =null �� �ƴϰ� is null �� �����!

select employee_id, last_name, job_id, salary
from employees
where salary >= 10000 and job_id like '%MAN%';

select employee_id, last_name, job_id, salary
from employees
where salary >= 10000 or job_id like '%MAN%';

select last_name, job_id
from employees
where job_id not in ('IT_PROG', 'ST_CLERK', 'SA_REP');

select last_name, job_id, salary
from employees
where job_id = 'SA_REP'
or job_id = 'AD_PRES'
and salary = 15000;

select last_name, job_id, salary
from employees
where (job_id = 'SA_REP' or job_id = 'AD_PRES')
      and salary = 15000;

-- 1��
select last_name, salary
from employees
where salary > 12000;

-- 2��
select last_name, department_id
from employees
where employee_id = 176;
-- where employee_id in (176);

-- 3��
select last_name, salary
from employees
where salary not between 5000 and 12000;

-- 6��
select last_name as "Employee", salary as "Monthly Salary"
from employees
where salary between 5000 and 12000
      and department_id in (20, 50);

-- 7��
select last_name, hire_date
from employees
where hire_date like '05%';
--where hire_date between '05/01/01' and '05/12/31';

-- 8��
select last_name, job_id
from employees
where manager_id is null;

-- 10��
select last_name
from employees
where last_name like '__a%';

-- 11��
select last_name
from employees
where last_name like '%a%'
      and last_name like '%e%';

-- 12��
select last_name, job_id, salary
from employees
where job_id in ('SA_REP','ST_CLERK')
      and salary not in (2500, 3500, 7000);

-- 13��
select last_name, salary, commission_pct
from employees
where commission_pct = 0.2;

select last_name, job_id, department_id, hire_date
from employees
order by hire_date;

select last_name, job_id, department_id, hire_date
from employees
order by hire_date desc; -- ��������

select employee_id, last_name, salary*12 as annsal
from employees 
order by annsal; -- �� ��Ī���ε� ���İ���

select last_name, job_id, department_id, hire_date
from employees
order by 3;

select last_name, department_id, salary
from employees
order by department_id, salary desc;

select employee_id, salary
from employees
order by hire_date;

-- ġȯ���� (�Է°��� &~���� ��)
select employee_id, last_name, salary, department_id
from employees
where employee_id = &employee_num;

select employee_id, last_name, job_id, &column_name
from employees
where &condition
order by &order_colnum;

select employee_id, last_name, job_id, &&column_name -- &&�Է°��� ġȯ���������� ����� ������ &~�ξ�
from employees
order by &column_name;

select employee_id, salary
from employees
order by &column_name;

undefine column_name; -- &&�Է°� ��������  p119

select employee_id, salary
from employees
order by &column_name;

select *
from job_history;

-- union (������ - �ڵ��ߺ�����) - �ڵ� �������� ����
select employee_id, job_id
from employees
union
select employee_id, job_id
from job_history;

-- union all (������ - �ߺ�����) - �ڵ����� �ȵ� - order by ����ؾ���.
select employee_id, job_id
from employees
union all
select employee_id, job_id
from job_history
order by employee_id;

-- intersect (������ - �ڵ��ߺ�����)
select employee_id, job_id
from employees
intersect
select employee_id, job_id
from job_history
order by employee_id;

-- �����հ� �������� ��ġ�ٲ� ����� ����.
select employee_id, job_id
from job_history
intersect
select employee_id, job_id
from employees
order by employee_id;

-- minus (������)
select employee_id, job_id
from employees
minus
select employee_id, job_id
from job_history;

-- �������� ��ġ �ٲ�� ��� �޶���.
select employee_id, job_id
from job_history
minus
select employee_id, job_id
from employees;

desc dual;

select *
from dual;

select sysdate
from dual;

select 'The job id for ' ||upper(last_name)||' id ' ||lower(job_id) as "EMPLOYEE DETAILS"
from employees;

select employee_id, last_name, department_id
from employees
where lower(last_name) = 'higgins';

select last_name, substr(last_name, -3, 2)
from employees
where department_id = 90;

select employee_id, concat(first_name, last_name) name,
job_id, length(last_name), instr(last_name,'a') "Contains 'a'?"
from employees
where substr(job_id, 4) = 'REP';

select ltrim('yyedaymy','yea')
from dual;

select rtrim('yyedaymy','yea')
from dual;

select round(345.678) as round1,
round(345.678, 0) as round2,
round(345.678, 1) as round3,
round(345.678, -1) as round4
from dual;

select trunc(345.678) as round1,
trunc(345.678, 0) as round2,
trunc(345.678, 1) as round3,
trunc(345.678, -1) as round4
from dual;

select last_name, salary, mod(salary, 5000)
from employees;

-- 1. ���� ��¥�� ǥ���ϴ� ���Ǹ� �ۼ��ϰ� �� ���̺��� Date�� �����Ͻÿ�.
select sysdate "Date"
from dual;

-- 2. �� ����� ���� ��� ��ȣ, �̸�, �޿� �� 15% �λ�� �޿��� ������ ǥ���Ͻÿ�. �λ�� �޿� ���� ���̺��� New Salary�� �����Ͻÿ�. 
select employee_id, last_name, salary,
round(salary * 1.15) as "New Salary"
from employees;

-- 3. 2�� ���Ǹ� �����Ͽ� �� �޿����� ���� �޿��� ���� �� ���� �߰��ϰ� ���̺��� Increase�� �����ϰ� ������ ���Ǹ� �����Ͻÿ�.
select employee_id, last_name, salary,
round(salary * 1.15) as "New Salary",
round((salary * 1.15) - salary) as "Increase"
from employees;
-- 4. �̸��� J, A �Ǵ� M���� �����ϴ� ��� ����� �̸�(�빮�� ǥ��) �� �̸� ���̸� ǥ���ϴ� ���Ǹ� �ۼ��ϰ� ������ ������ ���̺��� �����Ͻÿ�. ����� ����� �̸��� ���� �����Ͻÿ�.
select upper(last_name) as name , length(last_name) as name_length
from employees
where upper(substr(last_name, 1, 1)) in ('J','A','M')
--where last_name like 'J%' 
--or last_name like 'A%'
--or last_name like 'M%'
order by last_name;

