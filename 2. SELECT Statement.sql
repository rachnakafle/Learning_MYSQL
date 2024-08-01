SELECT * 
FROM parks_and_recreation.employee_demographics;

SELECT first_name, 
last_name,
 birth_date,
age,
(age+10)*10
FROM parks_and_recreation.employee_demographics;

#PEMDAS #PARENTHESIS #EXPONENTIAL #MULTIPLICATION #DIVISION #ADDITION #SUBSTRACTION

SELECT DISTINCT first_name, gender
FROM parks_and_recreation.employee_demographics;

SELECT * 
FROM employee_salary
WHERE first_name = 'Leslie';

SELECT * 
FROM employee_demographics
WHERE gender != 'FEMALE';

SELECT *
FROM employee_demographics
WHERE birth_date > '1985-01-01';

# --AND OR NOT --Logical Operators

SELECT *
FROM employee_demographics
WHERE birth_date > '1985-01-01'
OR NOT gender = 'male';

SELECT *
FROM employee_demographics
WHERE (first_name = 'Leslie' AND age = 44) OR age > 55;

-- LIKE STATEMENT
-- % AND _

SELECT *
FROM employee_demographics
WHERE first_name LIKE 'a___%';

SELECT *
FROM employee_demographics
WHERE birth_date LIKE '1989%';
