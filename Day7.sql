-------- Practice Questions Day 7 (11/10/2025)--------

-- 1.Find services that have admitted more than 500 patients in total.
SELECT service, SUM(patients_admitted) AS got_admission
FROM services_weekly GROUP BY service HAVING got_admission >500;

-- 2.Show services where average patient satisfaction is below 75.
SELECT service, AVG(patient_satisfaction) AS average_satisfaction
FROM services_weekly GROUP BY service HAVING average_satisfaction < 75;

-- 3.List weeks where total staff presence across all services was less than 50.
SELECT week, SUM(present) as total_staff_present FROM staff_schedule 
GROUP BY week HAVING total_staff_present < 50;



----------------- Daily Challenge -----------------
/* Question: Identify services that refused more than 100 patients 
   in total and had an average patient satisfaction below 80. 
   Show service name, total refused, and average satisfaction. */
   
   
SELECT service, 
ROUND(AVG(patient_satisfaction),2) AS average_satisfaction,
SUM(patients_refused) as total_patients_refused
FROM services_weekly 
GROUP BY service 
HAVING average_satisfaction < 80 AND total_patients_refused > 100;
   