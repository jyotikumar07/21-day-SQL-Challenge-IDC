
-- ======================================================================================================

-- Q1. Show each patient with their service's average satisfaction as an 
--    additional column.


SELECT 
p.patient_id, p.name, p.service, 
(SELECT  
 round(avg(patient_satisfaction),2)
 from services_weekly as s where p.service = s.service
) as avg_satisfaction
FROM patients p
ORDER BY p.service ASC, avg_satisfaction DESC;



-- =======================================================================================================
-- Q2. Create a derived table of service statistics and query from it.
SELECT * FROM hospital.services_weekly;

SELECT 
service, total_beds, 
CONCAT(ROUND((total_admission/total_request)*100,0), "%") AS admission_rate,
CONCAT(ROUND((total_refusal/total_request)*100,0), "%") AS refusal_rate
FROM 
	(SELECT 
	 service, SUM(available_beds) AS total_beds, SUM(patients_request) AS total_request, 
	 SUM(patients_admitted) AS total_admission, SUM(patients_refused) AS total_refusal
	 FROM services_weekly GROUP BY service
	) AS temp
ORDER BY total_beds DESC, refusal_rate DESC;


-- ==============================================================================================

-- Q3. Display staff with their service's total patient count as a calculated field.

SELECT 
staff_id, staff_name, service,
(select count(patient_id) from patients AS p where p.service =s.service) AS patient_count
FROM staff AS s ORDER BY service ASC, patient_count DESC;


--  ==================================================================================================
-- 										Daily Challenge
# Question: Create a report showing each service with: service name, total patients admitted, the difference 
# between their total admissions and the average admissions across all services, and a rank 
# indicator ('Above Average', 'Average', 'Below Average'). Order by total patients admitted descending.






SELECT service, total_admission , 
	   (total_admission - avg_admission) as diff,
	   (CASE 
	    WHEN total_admission > avg_admission THEN "Above Average"
        WHEN total_admission = avg_admission THEN "Average"
        WHEN total_admission < avg_admission THEN "Below Average"
		END
	   ) AS level
FROM 
	(SELECT service, total_admission, 
		(SELECT round(AVG(total_admission),2) 
		 FROM 
			( SELECT service, 
              SUM(patients_admitted) AS total_admission
              FROM services_weekly 
              GROUP BY service) AS temp
		) AS avg_admission
	FROM
		(SELECT service, SUM(patients_admitted) AS total_admission
		 FROM services_weekly 
		 GROUP BY service) AS total
	GROUP BY 1,2) AS everything
GROUP BY 1,2
ORDER BY total_admission DESC;




/*
SELECT service, total_admission, 
	   (SELECT round(AVG(total_admission),2) 
        FROM 
			( SELECT service, 
              SUM(patients_admitted) AS total_admission
              FROM services_weekly 
              group by service) AS temp
		) AS avg_admission
FROM
(SELECT service, SUM(patients_admitted) AS total_admission
FROM services_weekly 
group by service) AS total
GROUP BY 1,2;

*/