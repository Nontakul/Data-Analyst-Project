/* Mean of salary in each department */
SELECT department AS Department,
	AVG(salary) AS AVG_Salary
FROM worker
GROUP BY department
ORDER BY AVG_Salary;

/* Count all employee in each department and sorting from max to min*/
SELECT department AS Department,
	COUNT(first_name) AS Employee_Amount
FROM worker
GROUP BY department
ORDER BY Employee_Amount DESC;

/* Show the employees who have same salary*/
SELECT first_name, 
	last_name,
    salary
FROM worker 
WHERE salary IN (
    SELECT salary
    FROM worker
    GROUP BY salary
    HAVING COUNT(*) > 1
)
ORDER BY salary;

/* Show the departments that get most bonus*/
SELECT department,
	SUM(bonus_amount) AS Total_Bonus
FROM worker
INNER JOIN bonus
on worker.worker_id = bonus.worker_ref_id
GROUP BY department
ORDER BY Total_Bonus DESC;

/* Show the employees who have most revenus in each position */
SELECT
	first_name,
	last_name,
    SUM(salary+bonus_amount) AS Total_Salary,
    department,
    worker_title
FROM worker
INNER JOIN bonus
on worker.worker_id = bonus.worker_ref_id
INNER JOIN title
ON worker.worker_id = title.worker_ref_id
GROUP BY first_name
ORDER BY Total_Salary DESC;

/* Show the positions that have most salary in each department */
SELECT worker_title,
	department, 
	SUM(salary) AS Sum_Salary 
FROM worker
INNER JOIN title
on worker.worker_id = title.worker_ref_id
GROUP BY worker_title
ORDER BY Sum_Salary  DESC;
