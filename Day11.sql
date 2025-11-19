-- ----------------- Practice Questions Day 11(11/14/2025)---------------------

-- 1. List all unique services in the patients table.

SELECT DISTINCT(service)  as unique_service FROM patients;

-- 2. Find all unique staff roles in the hospital.

SELECT DISTINCT(role) as unique_role FROM staff;

-- 3. Get distinct months from the services_weekly table.

SELECT DISTINCT(month) as unique_month FROM services_weekly;





-- -------------- Daily Challenge -----------------

/* Question: Find all unique combinations of service and event type 
   from the services_weekly table where events are not null or none, 
   along with the count of occurrences for each combination. 
   Order by count descending. */
 
 
 
SELECT 
	DISTINCT service, event, COUNT(event) AS num_events
FROM 
	services_weekly
GROUP BY 
	service,event
HAVING
	event <> "none" AND event IS NOT NULL
ORDER BY 
	num_events DESC ;
    
    