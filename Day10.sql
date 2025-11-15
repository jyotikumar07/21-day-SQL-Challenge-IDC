
----------------- Practice Questions Day 10(11/13/2025)---------------------

-- 1.Categorise patients as 'High', 'Medium', or 'Low' satisfaction based 
-- 	 on their scores.
SELECT 
	name,
    CASE 
		WHEN satisfaction BETWEEN 60 AND 70 THEN "Low"
        WHEN satisfaction BETWEEN 71 AND 80 THEN "Medium"
        WHEN satisfaction BETWEEN 81 AND 99 THEN "High"
    END AS satisfaction_level
FROM patients;


-- 2.Label staff roles as 'Medical' or 'Support' based on role type.

SELECT 
	staff_name,
    CASE 
		WHEN role = "nursing_assistant" THEN "Support"
        ELSE "Medical"
    END AS role_play
FROM staff;


-- 3.Create age groups for patients (0-18, 19-40, 41-65, 65+).

SELECT 
	name,
    CASE 
		WHEN age BETWEEN 0 AND 18 THEN "0-18"
        WHEN satisfaction BETWEEN 19 AND 40 THEN "19-40"
        WHEN satisfaction BETWEEN 41 AND 65 THEN "41-65"
        ELSE "65+"
    END AS age_group
FROM patients;


-------------- Daily Challenge -----------------

/* Question: Create a service performance report showing service name, 
   total patients admitted, and a performance category based on the 
   following: 'Excellent' if avg satisfaction >= 85, 'Good' if >= 75, 
   'Fair' if >= 65, otherwise 'Needs Improvement'. 
   Order by average satisfaction descending.         */



SELECT 
	service,
    SUM(patients_admitted) as total_admitted,
    CASE 
		WHEN AVG(patient_satisfaction) >= 85 THEN "Excellent"
        WHEN AVG(patient_satisfaction) >= 75 THEN "Good"
        WHEN AVG(patient_satisfaction) >= 65 THEN "Fair"
        ELSE "Needs Improvement"
    END AS satisfaction_level,
    ROUND(AVG(patient_satisfaction),0) AS avg_satisfaction
FROM services_weekly
GROUP BY service
ORDER BY avg_satisfaction DESC;
   
