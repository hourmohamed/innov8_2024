SELECT * FROM employee;

SELECT employee.Fname, employee.Lname, employee.Dno FROM employee;

SELECT project.Pname, project.Plocation, project.Dnum FROM project;

SELECT employee.Fname, employee.Lname, employee.Salary*0.1 AS "ANNUAL COMM" FROM employee;

SELECT employee.SSN, employee.Fname, employee.Lname, employee.Salary FROM employee WHERE employee.Salary>1000;

SELECT employee.SSN, employee.Fname, employee.Lname FROM employee WHERE employee.salary*12>10000;

SELECT employee.Fname, employee.Lname, employee.salary FROM employee WHERE employee.sex='F';

SELECT department.DNumber, department.Dname FROM department WHERE department.MGRSSN=968574;

SELECT project.Pnumber, project.Pname, project.Plocation FROM project WHERE project.Dnum='10';

SELECT department.DNumber, department.Dname, department.MGRSSN, dependent.dependent_name FROM department JOIN dependent ON department.MGRSSN=dependent.ESSN;

SELECT department.Dname, project.Pname FROM department JOIN project ON project.Dnum=department.DNumber;


SELECT employee.Fname, employee.Lname FROM employee JOIN department ON department.MGRSSN=employee.SSN;

SELECT project.Pname, project.Pnumber, project.Plocation, project.City FROM project WHERE project.City='Cairo' OR project.City='Alex';

SELECT project.Pname, project.Pnumber, project.Plocation, project.City, project.Dnum FROM project WHERE project.Pname LIKE 'A%';

SELECT employee.Fname, employee.Lname, employee.SSN FROM employee JOIN department WHERE department.DNumber=30 AND employee.Salary>=1000 AND employee.Salary<=2000;

SELECT employee.Fname, employee.Lname FROM employee JOIN department ON department.DNumber=employee.Dno JOIN works_for ON employee.SSN=works_for.ESSN JOIN project ON works_for.Pno=project.Pnumber WHERE department.DNumber=10 AND project.Pname='Al Rabwah' AND works_for.Hours=10;

SELECT employee.Fname, employee.Lname FROM employee JOIN dependent ;

SELECT project.Pname, SUM(works_for.Hours) FROM project JOIN works_for ON project.Pnumber=works_for.Pno GROUP BY project.Pname;

SELECT employee.Fname, employee.Lname, employee.SSN FROM employee JOIN works_for ON employee.SSN=works_for.ESSN GROUP BY employee.Fname; 

SELECT department.Dname, department.DNumber, department.MGRSSN, department.MGRStartdate FROM department JOIN employee ON employee.Dno=department.DNumber WHERE MIN(employee.SSN); 

SELECT department.Dname, MIN(employee.salary), MAX(employee.salary), AVG(employee.salary) FROM department JOIN employee ON employee.Dno=20; 

SELECT employee.Lname FROM employee JOIN department  ON employee.SSN = department.MGRSSN LEFT JOIN dependent ON employee.SSN = dependent.ESSN WHERE dependent.ESSN IS NULL;

SELECT department.Dname, department.DNumber FROM department JOIN employee ON department.DNumber=employee.Dno GROUP BY department.DNumber, department.Dname HAVING AVG(employee.salary) < (SELECT AVG(salary) FROM employee);

SELECT department.Dname, employee.Lname, employee.Fname, project.Pname FROM employee  JOIN department ON employee.Dno=department.Dnumber JOIN works_for ON employee.SSN=works_for.ESSN JOIN project ON works_for.Pno=project.Pno ORDER BY department.Dname, employee.Lname, employee.Fname;

SELECT project.Pno, department.Dname, employee.Fname, employee.Lname, employee.address, employee.BDate FROM project JOIN department ON project.Dnum=department.Dnumber JOIN employee ON department.MGRSSN=employee.SSN WHERE project.Plocation='Cairo';

SELECT project.Pno FROM project JOIN works_for ON project.Pno=works_for.Pno JOIN employee ON works_for.ESSN=employee.SSN
UNION SELECT project.Pno FROM project JOIN department ON department.Dnumber=project.Pno JOIN employee ON department.MGRSSN=employee.SSN WHERE employee.Lname='Mohamed';

SELECT employee.SSN, employee.Fname, employee.Lname FROM employee WHERE NOT EXISTS (SELECT 1 FROM dependents WHERE dependents.ESSN=employee.SSN);


INSERT INTO employee(Fname, Lname, SSN, BDate, address, sex, salary, Superssn, Dno) VALUES ('Hour', 'Mohamed', 102672, '2003-01-10', 'Mustafa Kamel', 'F', '2000', 112233, 30);

INSERT INTO employee(Fname, Lname, SSN, BDate, address, sex, salary, Superssn, Dno) VALUES ('Hana', 'Ahmed', 102660, '2003-03-20', 'Smouha', 'F', NULL, NULL, 30);

INSERT INTO department(Dname, Dnumber, MGRSSN, MGRStartdate) VALUES ('DEPT IT', 100, 112233, 2006-11-01);

UPDATE department SET MGRSSN = '968574', MGRStartdate = '2024-07-21' WHERE DNumber = 100;
UPDATE department SET MGRSSN = '102672', MGRStartdate = '2024-07-21' WHERE DNumber = 20;
UPDATE employee SET Superssn = '102672' WHERE SSN = '102660';
  

UPDATE employee SET Dno = (SELECT Dno FROM Employee WHERE SSN = '223344') WHERE SSN = '102672';
UPDATE employee SET Superssn = '102672' WHERE SSN = '223344';
DELETE FROM dependents WHERE ESSN = '223344';
UPDATE employee SET Superssn = '102672' WHERE Superssn = '223344';
DELETE FROM works_for WHERE ESSN = '223344';
DELETE FROM employee WHERE SSN = '223344';

UPDATE Employee SET Salary = Salary * 1.20 WHERE SSN = '102672';