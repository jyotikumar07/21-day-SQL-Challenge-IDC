-- ----------------- Practice Questions Day 13(11/17/2025)---------------------
-- 1. Join patients and staff based on their common service field (show patient and staff who work in same service).
SELECT 
	p.name as patient_name, 
    p.service, 
    s.staff_name 
FROM patients p
INNER JOIN staff s
ON p.service = s.service;

-- 2. Join services_weekly with staff to show weekly service data with 
-- staff information.
SELECT *
FROM services_weekly AS sw
INNER JOIN staff AS s
ON sw.service = s.service;


-- 3. Create a report showing patient information along with staff assigned to 
-- their service.
SELECT 
p.name AS patient_name,
p.age, p.arrival_date, p.satisfaction,
s.staff_name, s.role, s.service
FROM patients p
INNER JOIN staff s
ON p.service = s.service;



-- -------------- Daily Challenge -----------------
/* Question: Create a comprehensive report showing patient_id, patient name, age, 
   service, and the total number of staff members available in their service. 
   Only include patients from services that have more than 5 staff members. 
   Order by number of staff descending, then by patient name.    */
   
SELECT 
p.patient_id, p.name, p.age, p.service, 
count(staff_id) as staff_count
FROM patients p
INNER JOIN staff s
ON p.service = s.service
GROUP BY p.patient_id, p.name, p.age, p.service
HAVING staff_count > 5 
ORDER BY staff_count DESC, p.name;