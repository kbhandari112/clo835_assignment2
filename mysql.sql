CREATE DATABASE IF NOT EXISTS employees;
USE employees;

CREATE TABLE IF NOT EXISTS employee(
emp_id VARCHAR(20),
first_name VARCHAR(20),
last_name VARCHAR(20),
primary_skill VARCHAR(20),
location VARCHAR(20));

INSERT INTO employee VALUES ('1','Ajay','Singh','Student','Mississauga');
INSERT INTO employee VALUES ('2','Ryan','Shack','Developer','Hongkong');
INSERT INTO employee VALUES ('3','Kenji','Hububu','Plumber','Singapore');
INSERT INTO employee VALUES ('4','Akhram','Hussein','Engineer','Dubai');
SELECT * FROM employee;

