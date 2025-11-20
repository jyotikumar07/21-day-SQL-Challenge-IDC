-- ----------------- Practice Questions Day 14(11/18/2025)---------------------
-- 1. Join patients, staff, and staff_schedule to show patient service and 
-- 	  staff availability.

SELECT 
p.name, p.service,
s.staff_name, s.role,
ss.week, ss.present
FROM patients as p
LEFT JOIN staff AS s
ON p.service = s.service
LEFT JOIN staff_schedule AS ss
ON s.staff_id = ss.staff_id;



-- 2. Combine services_weekly with staff and staff_schedule for comprehensive 
--    service analysis.

SELECT 
sw.month, sw.week, sw.service, sw.available_beds, sw.patients_request,
s.staff_name, s.role,
ss.present
FROM services_weekly AS sw
LEFT JOIN staff AS s
ON sw.service = s.service
LEFT JOIN staff_schedule AS ss
ON s.staff_id = ss.staff_id;




-- 3. Create a multi-table report showing patient admissions with staff information.

SELECT 
p.name as patient_name, p.service,
s.staff_name, s.role,
sw.patients_admitted, sw.patients_refused
FROM patients AS p
LEFT JOIN staff AS s
ON p.service = s.service
LEFT JOIN services_weekly AS sw
ON p.service = sw.service ;




-- -------------- Daily Challenge -----------------
/* Question: Create a comprehensive service analysis report for week 20 showing: 
   service name, total patients admitted that week, total patients refused, 
   average patient satisfaction, count of staff assigned to service, and count of 
   staff present that week. Order by patients admitted descending.  */
   
   
SELECT 
sw.service, 
SUM(sw.patients_admitted) AS admitted_patients,
SUM(sw.patients_refused) AS refused_patients, 
ROUND(AVG(sw.patient_satisfaction),0) AS average_satisfaction,
COUNT(DISTINCT ss.staff_id) AS total_staff,
SUM(ss.present) AS staff_present
FROM services_weekly AS sw
LEFT JOIN staff_schedule AS ss
ON sw.service = ss.service AND sw.week = ss.week
WHERE sw.week = 20
GROUP BY 1
ORDER BY admitted_patients DESC;
   
   