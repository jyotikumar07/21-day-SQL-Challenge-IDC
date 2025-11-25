
-- ============================================================================
# Q1.Rank patients by satisfaction score within each service.

SELECT service, patient_id, name, satisfaction,
DENSE_RANK() OVER ( PARTITION BY service ORDER BY satisfaction DESC) AS satisfaction_rank
FROM patients;

-- ============================================================================
# Q2.Assign row numbers to staff ordered by their name.

SELECT staff_name, 
	   ROW_NUMBER() OVER ( ORDER BY staff_name) as number
FROM staff;

-- ============================================================================
# Q3.Rank services by total patients admitted.

SELECT service, 
	   total_admission,
       DENSE_RANK() OVER( ORDER BY total_admission DESC) AS admission_rank
FROM
(	SELECT service, 
	       SUM(patients_admitted) AS total_admission
	FROM services_weekly
    GROUP BY service
) temp
;


-- ============================================================================

# Question: For each service, rank the weeks by patient satisfaction score 
# (highest first). Show service, week, patient_satisfaction, patients_admitted, 
# and the rank. Include only the top 3 weeks per service.

SELECT * FROM
( SELECT service, week, 
	   patient_satisfaction, patients_admitted,
       DENSE_RANK() 
       OVER(PARTITION BY service ORDER BY patient_satisfaction DESC) 
       AS satisfaction_rank
 FROM services_weekly
) temp
WHERE satisfaction_rank <= 3;


       
       
       
       