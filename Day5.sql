
-------- Practice Questions --------

-- 1.Count the total number of patients in the hospital.
SELECT COUNT(DISTINCT patient_id) as Total_patients FROM patients;

-- 2.Calculate the average satisfaction score of all patients.
SELECT ROUND(AVG( satisfaction),2) as Avg_satisfaction FROM patients;

-- 3.Find the minimum and maximum age of patients.
SELECT MIN(age) as Minimum_age, MAX(age) as Maximum_age FROM patients;




----------------- Daily Challenge -----------------

/* Question: Calculate the total number of patients admitted, 
total patients refused, and the average patient satisfaction 
across all services and weeks. Round the average satisfaction 
to 2 decimal places. */

SELECT SUM(patients_admitted) as admitted, SUM(patients_refused) as refused,
ROUND(AVG(patient_satisfaction),2) as average
FROM services_weekly;


