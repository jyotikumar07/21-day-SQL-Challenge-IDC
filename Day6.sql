-------- Practice Questions Day6(11/09/2025)--------
-- 1.Count the number of patients by each service.
SELECT service, COUNT(patient_id) as patients 
FROM patients GROUP BY service;

-- 2.Calculate the average age of patients grouped by service.
SELECT service, ROUND(AVG(age),2) as age
FROM patients GROUP BY service;

-- 3.Find the total number of staff members per role.
SELECT role, COUNT(staff_id) as staff
FROM staff GROUP BY role;

----------------- Daily Challenge -----------------
/* Question: For each hospital service, calculate the 
   total number of patients admitted, total patients refused, 
   and the admission rate (percentage of requests that were admitted). 
   Order by admission rate descending. */
   
SELECT service, SUM(patients_admitted) as admitted,
	   SUM(patients_refused) as refused,
       ROUND((SUM(patients_admitted)/SUM(patients_request))*100,2) 
       as admission_rate
FROM services_weekly
GROUP BY service ORDER BY admission_rate DESC;