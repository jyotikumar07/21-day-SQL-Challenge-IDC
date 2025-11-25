

-- =======================================================
-- 1.Find patients who are in services with above-average staff count.

SELECT patient_id, name, service FROM patients
WHERE service IN 
	(SELECT service FROM staff GROUP BY service HAVING COUNT(staff_id) >
	(SELECT AVG(staff_count) FROM 
	(SELECT COUNT(staff_id) as staff_count 
	FROM staff GROUP BY service) AS staff_avg_count )
);





-- =======================================================
-- 2. List staff who work in services that had any week with patient 
-- satisfaction below 70

SELECT staff_id, staff_name, role, service FROM staff 
WHERE service IN 
(SELECT service FROM services_weekly
WHERE patient_satisfaction < 70)
ORDER BY service ASC;




-- =======================================================
-- 3. Show patients from services where total admitted patients exceed 1000.

SELECT patient_id, name, service FROM patients 
WHERE service IN 
	(SELECT service FROM services_weekly
	 GROUP BY service HAVING SUM(patients_admitted) > 1000
	)
ORDER BY service ASC;




-- ==================================================================================
/* Question: Find all patients who were admitted to services that had at least 
   one week where patients were refused AND the average patient satisfaction for 
   that service was below the overall hospital average satisfaction. 
   Show patient_id, name, service, and their personal satisfaction score.   */
   

SELECT patient_id, name, service, satisfaction FROM patients WHERE service IN 
(
	SELECT service FROM services_weekly 
	WHERE patients_refused IS NOT NULL AND patients_refused != 0
	GROUP BY SERVICE 
	HAVING AVG(patient_satisfaction)
	<
	(SELECT ROUND(AVG(patient_satisfaction),0) AS avg_sat FROM services_weekly)
) ORDER BY service ASC, satisfaction DESC;




