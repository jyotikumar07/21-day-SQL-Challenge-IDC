-- ============================================================================
# Q1.Create a CTE to calculate service statistics, then query from it.

WITH ser_stat AS 
(
	SELECT service, COUNT(patient_id) AS total_pat,
	ROUND(AVG(satisfaction),0) AS avg_sat
	FROM patients
	GROUP BY service
)

SELECT * FROM ser_stat
WHERE avg_sat >70
ORDER BY total_pat DESC;


-- ============================================================================
# Q2.Use multiple CTEs to break down a complex query into logical steps.



WITH p_stats AS (
SELECT 
service, 
COUNT(patient_id) AS total_patients,
ROUND(AVG(age),0) AS avg_age,
ROUND(AVG(satisfaction),0) AS avg_satisfaction
FROM patients
GROUP BY service
),
s_stats AS (
SELECT service,
COUNT(staff_id) AS total_staff
FROM staff
GROUP BY service
),
sw_stats AS (
SELECT service,
SUM(patients_admitted) AS total_admission,
SUM(patients_refused) AS total_refusal
FROM services_weekly
GROUP BY service
)
SELECT p.total_patients,
p.avg_age, p.avg_satisfaction,
s.total_staff, sw.total_admission, sw.total_refusal,
ROUND( (100* sw.total_admission)/(sw.total_admission + sw.total_refusal),0) as admission_rate
FROM p_stats AS p
LEFT JOIN s_stats AS s
ON p.service = s.service
LEFT JOIN sw_stats AS sw
ON p.service = sw.service
ORDER BY p.avg_satisfaction;

-- ============================================================================
# Q3.Build a CTE for staff utilization and join it with patient data.

WITH s_summary AS (
SELECT service, 
COUNT(staff_id) AS staff_count
FROM staff
GROUP BY service
)

SELECT p.service, COUNT(patient_id) as patient_count,
ROUND(100*(s.staff_count/  COUNT(patient_id)),0) AS staff_to_patient_ratio
FROM patients AS p
INNER JOIN 
s_summary AS s
ON p.service = s.service
GROUP BY service;
-- ============================================================================

# Question: Create a comprehensive hospital performance dashboard using CTEs. 
# Calculate: 1) Service-level metrics 
# (total admissions, refusals, avg satisfaction), 2) 
# Staff metrics per service (total staff, avg weeks present), 3) 
# Patient demographics per service (avg age, count). Then combine all three 
# CTEs to create a final report showing service name, all calculated metrics, 
# and an overall performance score (weighted average of admission rate and 
# satisfaction). Order by performance score descending.



WITH sw_metrics AS (
SELECT service,
SUM(patients_admitted) AS total_admission,
SUM(patients_refused) AS total_refusal,
ROUND(AVG(patient_satisfaction),0) AS avg_satisfaction
FROM services_weekly
GROUP BY service
),
ss_metrics AS (
SELECT service,
COUNT(DISTINCT staff_id) AS total_staff,
ROUND(SUM(present)/COUNT(week)*100.0,2) AS avg_week_present
FROM staff_schedule
GROUP BY service
),
p_metrics AS (
SELECT service,
COUNT(patient_id) AS total_patients,
ROUND(AVG(age),0) AS avg_age,
ROUND(AVG(satisfaction),0) AS avg_satisfaction
FROM patients
GROUP BY service
)
SELECT sw.service, p.total_patients,p.avg_age,
ss.total_staff, ss.avg_week_present ,sw.total_admission, sw.total_refusal, sw.avg_satisfaction,
ROUND( (100* sw.total_admission)/(sw.total_admission + sw.total_refusal),0) as admission_rate
FROM p_metrics AS p
LEFT JOIN ss_metrics AS ss
ON p.service = ss.service
LEFT JOIN sw_metrics AS sw
ON p.service = sw.service
ORDER BY p.avg_satisfaction;






