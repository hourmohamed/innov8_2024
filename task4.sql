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
SELECT department.Dname, department.DNumber, department.MGRSSN, department.MGRStartdate FROM department JOIN employee ON employee.Dno=department.DNumber WHERE MIN(employee.SSN); #how to join with employee and use min function
SELECT department.Dname, MIN(employee.salary), MAX(employee.salary), AVG(employee.salary) FROM department JOIN employee ON employee.Dno=20; #only displays department 1
SELECT employee.Lname FROM employee JOIN department  ON employee.SSN = department.MGRSSN LEFT JOIN dependent ON employee.SSN = dependent.ESSN WHERE dependent.ESSN IS NULL; #msh fahmaha
SELECT department.Dname, department.DNumber FROM department JOIN employee ON department.DNumber=employee.Dno GROUP BY department.DNumber, department.Dname HAVING AVG(employee.salary) < (SELECT AVG(salary) FROM employee); #msh fahmaahaa




