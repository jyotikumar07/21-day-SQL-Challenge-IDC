
-------- Practice Questions Day3(11/05/2025)--------
-- 1. List all patients sorted by age in descending order.
SELECT patient_id, name, age FROM patients ORDER BY age DESC;

-- 2. Show all services_weekly data sorted by week number 
-- 	  ascending and patients_request descending.
SELECT * FROM services_weekly ORDER BY week ASC, patients_request DESC; 

-- 3. Display staff members sorted alphabetically by their names.
SELECT * FROM staff ORDER BY staff_name;

------------------------------------------------------------------------------------------------

-------- Daily Challenge --------
/* Question: Retrieve the top 5 weeks with the highest patient refusals across 
   all services, showing week, service, patients_refused, and patients_request. 
   Sort by patients_refused in descending order. */

WITH highest AS(
	SELECT week, service, patients_refused, patients_request, 
    RANK() OVER(PARTITION BY service ORDER BY patients_refused desc) as Rank_ 
	FROM services_weekly 
)

SELECT week, service, patients_refused, patients_request
FROM highest WHERE Rank_ <=5;