CREATE DATABASE employee_project;
USE employee_project;
CREATE TABLE departments (
    dept_id INT AUTO_INCREMENT PRIMARY KEY,
    dept_name VARCHAR(100)
);
INSERT INTO departments (dept_name)
VALUES 
('IT'),
('HR'),
('Finance'),
('Marketing'),
('Operations');
CREATE TABLE employees (
    emp_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    dept_id INT,
    designation VARCHAR(100),
    join_date DATE,
    FOREIGN KEY (dept_id) REFERENCES departments(dept_id)
);
INSERT INTO employees (name, dept_id, designation, join_date)
VALUES
('Ravi Kumar',1,'Developer','2023-01-10'),
('Sneha Patel',2,'Manager','2022-05-15'),
('Anjali Sharma',3,'Analyst','2023-03-20'),
('Rahul Verma',1,'Tester','2023-06-01'),
('Priya Reddy',3,'Manager','2021-07-12'),

('Arjun Mehta',1,'Developer','2022-09-18'),
('Kiran Rao',2,'Executive','2023-02-25'),
('Neha Singh',4,'Analyst','2022-11-05'),
('Vikram Joshi',1,'Team Lead','2021-03-30'),
('Pooja Sharma',3,'Clerk','2023-08-14'),


('Kavya Nair',4,'Executive','2023-07-19'),
('Manish Singh',1,'Support','2022-03-11'),
('Deepak Yadav',2,'Executive','2023-01-05'),
('Sunita Reddy',3,'Manager','2020-11-23'),
('Ajay Sharma',5,'Manager','2021-06-30'),

('Nikita Jain',4,'Analyst','2023-02-18'),
('Harish Kumar',1,'Developer','2022-10-09'),
('Swati Mishra',2,'Recruiter','2023-05-27'),
('Pradeep Verma',3,'Clerk','2021-12-12'),
('Anil Kapoor',5,'Executive','2022-04-16'),

('Rakesh Sharma',1,'Developer','2023-03-11'),
('Sonal Gupta',2,'Executive','2022-07-19'),
('Tarun Khanna',3,'Accountant','2021-05-22'),
('Pallavi Joshi',4,'Executive','2023-01-30'),
('Ritu Singh',5,'Supervisor','2022-06-14'),

('Priyanka Sharma',2,'Manager','2020-08-21'),
('Abhishek Singh',1,'Support','2023-01-12'),
('Komal Verma',3,'Executive','2022-09-30'),
('Rahul Nair',4,'Analyst','2023-04-18'),
('Dinesh Yadav',5,'Executive','2021-07-25');
CREATE TABLE attendance (
    attendance_id INT AUTO_INCREMENT PRIMARY KEY,
    emp_id INT,
    date DATE,
    status VARCHAR(20),
    check_in TIME,
    check_out TIME,
    FOREIGN KEY(emp_id) REFERENCES employees(emp_id)
);
INSERT INTO attendance (emp_id, date, status, check_in, check_out)
VALUES
(1,'2025-03-01','Present','09:00:00','18:00:00'),
(2,'2025-03-01','Absent',NULL,NULL),
(3,'2025-03-01','Present','09:30:00','18:30:00'),
(4,'2025-03-01','Leave',NULL,NULL),
(5,'2025-03-01','Present','09:10:00','18:05:00');
SELECT * FROM employees;
SELECT * FROM attendance;
SELECT e.name, d.dept_name, a.status
FROM employees e
JOIN departments d ON e.dept_id = d.dept_id
JOIN attendance a ON e.emp_id = a.emp_id;
SELECT e.name, a.check_in
FROM attendance a
JOIN employees e ON e.emp_id = a.emp_id
WHERE a.check_in > '09:15:00';
SELECT d.dept_name, COUNT(*) 
FROM employees e
JOIN departments d ON e.dept_id = d.dept_id
GROUP BY d.dept_name;
SELECT name, join_date
FROM employees
WHERE join_date = (SELECT MAX(join_date) FROM employees);
SELECT name, join_date
FROM employees
WHERE join_date = (SELECT MIN(join_date) FROM employees);
SELECT d.dept_name, COUNT(*) AS total
FROM employees e
JOIN departments d ON e.dept_id = d.dept_id
GROUP BY d.dept_name
ORDER BY total DESC
LIMIT 1;
SELECT d.dept_name, COUNT(*) AS total
FROM employees e
JOIN departments d ON e.dept_id = d.dept_id
GROUP BY d.dept_name
ORDER BY total ASC
LIMIT 1;
SELECT e.name, a.check_in
FROM employees e
JOIN attendance a ON e.emp_id = a.emp_id
WHERE a.check_in = (SELECT MAX(check_in) FROM attendance);
SELECT AVG(emp_count) 
FROM (
    SELECT COUNT(*) AS emp_count
    FROM employees
    GROUP BY dept_id
) AS dept_avg;
SELECT e.name
FROM employees e
LEFT JOIN attendance a ON e.emp_id = a.emp_id
WHERE a.emp_id IS NULL;
SELECT YEAR(join_date) AS year, COUNT(*) 
FROM employees
GROUP BY YEAR(join_date)
HAVING COUNT(*) > 1;
USE employee_project;
SELECT d.dept_name, COUNT(*) AS total
FROM employees e
JOIN departments d ON e.dept_id = d.dept_id
GROUP BY d.dept_name
ORDER BY total DESC
LIMIT 3;
SELECT e.name
FROM employees e
JOIN attendance a ON e.emp_id = a.emp_id
WHERE a.check_in = (
    SELECT MIN(check_in)
    FROM attendance
    WHERE check_in IS NOT NULL
);
SELECT e.name
FROM employees e
JOIN attendance a ON e.emp_id = a.emp_id
WHERE a.status = 'Leave';