-- ----------------- Practice Questions Day 14(11/18/2025)---------------------
-- 1. Show all staff members and their schedule information (including those with no schedule entries).

SELECT s.staff_id, s.staff_name, s.role, s.service, ss.week, ss.present
FROM staff AS s 
LEFT JOIN staff_schedule AS ss
ON s.staff_id = ss.staff_id;

-- 2. List all services from services_weekly and their corresponding staff (show services even if no staff assigned).

SELECT sw.service, s.staff_name, s.role
FROM services_weekly AS sw
LEFT JOIN staff AS s
ON sw.service = s.service;

-- 3. Display all patients and their service's weekly statistics (if available).
SELECT p.name, p.satisfaction, sw.service, sw.week, sw.month
FROM patients AS p
INNER JOIN services_weekly AS sw
ON p.service = sw.service;



-- -------------- Daily Challenge -----------------

/* Question: Create a staff utilisation report showing all staff members 
   (staff_id, staff_name, role, service) and the count of weeks they were 
   present (from staff_schedule). Include staff members even if they have 
   no schedule records. Order by weeks present descending.   */
   
SELECT s.staff_id, s.staff_name, s.role, s.service, 
COUNT(ss.week) AS weeks_present
FROM staff AS s
LEFT JOIN staff_schedule AS ss
ON s.staff_id = ss.staff_id
WHERE ss.present = 1
GROUP BY 1,2,3,4
ORDER BY weeks_present DESC, s.staff_name;

