
DROP TABLE "dept_emp"
DROP TABLE "dept_manager"
DROP TABLE "employees"
DROP TABLE "salaries"
DROP TABLE "titles"
DROP TABLE "departments"

CREATE TABLE "dept_emp" (
    "emp_no" int   NOT NULL,
    "dept_no" VARCHAR   NOT NULL,
    "employee_from_date" VARCHAR   NOT NULL,
    "employee_to_date" VARCHAR   NOT NULL
);

CREATE TABLE "dept_manager" (
    "dept_no" VARCHAR   NOT NULL,
    "emp_no" int   NOT NULL,
    "manager_from_date" VARCHAR   NOT NULL,
    "manager_to_date" VARCHAR   NOT NULL
);

CREATE TABLE "employees" (
    "emp_no" int   NOT NULL,
    "birth_date" VARCHAR   NOT NULL,
    "first_name" VARCHAR   NOT NULL,
    "last_name" VARCHAR   NOT NULL,
    "gender" VARCHAR   NOT NULL,
    "hire_date" VARCHAR   NOT NULL,
    CONSTRAINT "pk_employees" PRIMARY KEY (
        "emp_no"
     )
);

-- Table documentation comment 1 (try the PDF/RTF export)
-- Table documentation comment 2
CREATE TABLE "departments" (
    "dept_no" VARCHAR   NOT NULL,
    -- Field documentation comment 1
    -- Field documentation comment 2
    -- Field documentation comment 3
    "dept_name" varchar(200)   NOT NULL,
    CONSTRAINT "pk_departments" PRIMARY KEY (
        "dept_no"
     ),
    CONSTRAINT "uc_departments_dept_name" UNIQUE (
        "dept_name"
    )
);

CREATE TABLE "salaries" (
    "emp_no" int   NOT NULL,
    "salary" int   NOT NULL,
    "salary_from_date" VARCHAR   NOT NULL,
    "salary_to_date" VARCHAR   NOT NULL
);

CREATE TABLE "titles" (
    "emp_no" int   NOT NULL,
    "title" VARCHAR   NOT NULL,
    "title_from_date" VARCHAR   NOT NULL,
    "title_to_date" VARCHAR   NOT NULL
);

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "dept_emp" ADD CONSTRAINT "fk_dept_emp_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "dept_manager" ADD CONSTRAINT "fk_dept_manager_dept_no" FOREIGN KEY("dept_no")
REFERENCES "departments" ("dept_no");

ALTER TABLE "salaries" ADD CONSTRAINT "fk_salaries_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");

ALTER TABLE "titles" ADD CONSTRAINT "fk_titles_emp_no" FOREIGN KEY("emp_no")
REFERENCES "employees" ("emp_no");


--employees
SELECT employees.emp_no, employees.birth_date, employees.first_name, 
employees.last_name, employees.gender,employees.hire_date, dept_emp.employee_from_date, dept_emp.employee_to_date, dept_emp.dept_no, departments.dept_name,
dept_manager.manager_from_date, dept_manager.manager_to_date, salaries.salary, salaries.salary_from_date, salaries.salary_to_date,
titles.title, titles.title_from_date, titles.title_to_date
FROM dept_emp
RIGHT OUTER JOIN employees
ON employees.emp_no=dept_emp.emp_no
FULL OUTER JOIN dept_manager
ON dept_emp.emp_no=dept_manager.emp_no
FULL OUTER JOIN salaries
ON dept_emp.emp_no=salaries.emp_no
FULL OUTER JOIN titles
ON dept_emp.emp_no=titles.emp_no
FULL OUTER JOIN departments
ON dept_emp.dept_no=departments.dept_no



--employees from 1986
SELECT employees.emp_no, employees.birth_date, employees.first_name, 
employees.last_name, employees.gender,employees.hire_date, dept_emp.employee_from_date, dept_emp.employee_to_date, dept_emp.dept_no, departments.dept_name,
dept_manager.manager_from_date, dept_manager.manager_to_date, salaries.salary, salaries.salary_from_date, salaries.salary_to_date,
titles.title, titles.title_from_date, titles.title_to_date
FROM dept_emp
RIGHT OUTER JOIN employees
ON employees.emp_no=dept_emp.emp_no
FULL OUTER JOIN dept_manager
ON dept_emp.emp_no=dept_manager.emp_no
FULL OUTER JOIN salaries
ON dept_emp.emp_no=salaries.emp_no
FULL OUTER JOIN titles
ON dept_emp.emp_no=titles.emp_no
FULL OUTER JOIN departments
ON dept_emp.dept_no=departments.dept_no
WHERE hire_date>='1986-01-01' and hire_date<'1987-01-01'

--managers
SELECT employees.emp_no, employees.birth_date, employees.first_name, 
employees.last_name, employees.gender,employees.hire_date, dept_emp.employee_from_date, dept_emp.employee_to_date, dept_emp.dept_no, departments.dept_name,
dept_manager.manager_from_date, dept_manager.manager_to_date, salaries.salary, salaries.salary_from_date, salaries.salary_to_date,
titles.title, titles.title_from_date, titles.title_to_date
FROM dept_emp
RIGHT OUTER JOIN employees
ON employees.emp_no=dept_emp.emp_no
FULL OUTER JOIN dept_manager
ON dept_emp.emp_no=dept_manager.emp_no
FULL OUTER JOIN salaries
ON dept_emp.emp_no=salaries.emp_no
FULL OUTER JOIN titles
ON dept_emp.emp_no=titles.emp_no
FULL OUTER JOIN departments
ON dept_emp.dept_no=departments.dept_no
WHERE manager_from_date!='[null]'


--departments
SELECT employees.emp_no, employees.birth_date, employees.first_name, 
employees.last_name, employees.gender,employees.hire_date, dept_emp.employee_from_date, dept_emp.employee_to_date, dept_emp.dept_no, departments.dept_name,
dept_manager.manager_from_date, dept_manager.manager_to_date, salaries.salary, salaries.salary_from_date, salaries.salary_to_date,
titles.title, titles.title_from_date, titles.title_to_date
FROM dept_emp
RIGHT OUTER JOIN employees
ON employees.emp_no=dept_emp.emp_no
FULL OUTER JOIN dept_manager
ON dept_emp.emp_no=dept_manager.emp_no
FULL OUTER JOIN salaries
ON dept_emp.emp_no=salaries.emp_no
FULL OUTER JOIN titles
ON dept_emp.emp_no=titles.emp_no
FULL OUTER JOIN departments
ON dept_emp.dept_no=departments.dept_no


--employees named Hercules B.
SELECT employees.emp_no, employees.birth_date, employees.first_name, 
employees.last_name, employees.gender,employees.hire_date, dept_emp.employee_from_date, dept_emp.employee_to_date, dept_emp.dept_no, departments.dept_name,
dept_manager.manager_from_date, dept_manager.manager_to_date, salaries.salary, salaries.salary_from_date, salaries.salary_to_date,
titles.title, titles.title_from_date, titles.title_to_date
FROM dept_emp
RIGHT OUTER JOIN employees
ON employees.emp_no=dept_emp.emp_no
FULL OUTER JOIN dept_manager
ON dept_emp.emp_no=dept_manager.emp_no
FULL OUTER JOIN salaries
ON dept_emp.emp_no=salaries.emp_no
FULL OUTER JOIN titles
ON dept_emp.emp_no=titles.emp_no
FULL OUTER JOIN departments
ON dept_emp.dept_no=departments.dept_no
WHERE first_name='Hercules' AND last_name LIKE  'B%'


--Employees in sales
SELECT employees.emp_no, employees.birth_date, employees.first_name, 
employees.last_name, employees.gender,employees.hire_date, dept_emp.employee_from_date, dept_emp.employee_to_date, dept_emp.dept_no, departments.dept_name,
dept_manager.manager_from_date, dept_manager.manager_to_date, salaries.salary, salaries.salary_from_date, salaries.salary_to_date,
titles.title, titles.title_from_date, titles.title_to_date
FROM dept_emp
RIGHT OUTER JOIN employees
ON employees.emp_no=dept_emp.emp_no
FULL OUTER JOIN dept_manager
ON dept_emp.emp_no=dept_manager.emp_no
FULL OUTER JOIN salaries
ON dept_emp.emp_no=salaries.emp_no
FULL OUTER JOIN titles
ON dept_emp.emp_no=titles.emp_no
FULL OUTER JOIN departments
ON dept_emp.dept_no=departments.dept_no
WHERE dept_name='Sales'


--employees in sales and development
SELECT employees.emp_no, employees.birth_date, employees.first_name, 
employees.last_name, employees.gender,employees.hire_date, dept_emp.employee_from_date, dept_emp.employee_to_date, dept_emp.dept_no, departments.dept_name,
dept_manager.manager_from_date, dept_manager.manager_to_date, salaries.salary, salaries.salary_from_date, salaries.salary_to_date,
titles.title, titles.title_from_date, titles.title_to_date
FROM dept_emp
RIGHT OUTER JOIN employees
ON employees.emp_no=dept_emp.emp_no
FULL OUTER JOIN dept_manager
ON dept_emp.emp_no=dept_manager.emp_no
FULL OUTER JOIN salaries
ON dept_emp.emp_no=salaries.emp_no
FULL OUTER JOIN titles
ON dept_emp.emp_no=titles.emp_no
FULL OUTER JOIN departments
ON dept_emp.dept_no=departments.dept_no
WHERE dept_name='Sales' OR dept_name= 'Development'

--employee last name freq. count
SELECT  employees.last_name, COUNT(employees.last_name) AS last_name_frequency
FROM employees
GROUP BY last_name
ORDER BY last_name_frequency DESC


--Employee 499942
SELECT employees.emp_no, employees.birth_date, employees.first_name, 
employees.last_name, employees.gender,employees.hire_date, dept_emp.employee_from_date, dept_emp.employee_to_date, dept_emp.dept_no, departments.dept_name,
dept_manager.manager_from_date, dept_manager.manager_to_date, salaries.salary, salaries.salary_from_date, salaries.salary_to_date,
titles.title, titles.title_from_date, titles.title_to_date
FROM dept_emp
RIGHT OUTER JOIN employees
ON employees.emp_no=dept_emp.emp_no
FULL OUTER JOIN dept_manager
ON dept_emp.emp_no=dept_manager.emp_no
FULL OUTER JOIN salaries
ON dept_emp.emp_no=salaries.emp_no
FULL OUTER JOIN titles
ON dept_emp.emp_no=titles.emp_no
FULL OUTER JOIN departments
ON dept_emp.dept_no=departments.dept_no
WHERE dept_emp.emp_no=499942
