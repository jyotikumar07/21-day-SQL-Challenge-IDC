-- ============================================================================
# Q1.Calculate running total of patients admitted by week for each service.

SELECT service, week , 
patients_admitted AS pat_add,
SUM(patients_admitted) 
OVER(PARTITION BY service ORDER BY week) AS run_total
FROM services_weekly
ORDER BY service, week;


-- ============================================================================
#Q2.Find the moving average of patient satisfaction over 4-week periods.

SELECT service, week,
patient_satisfaction AS pat_sat,
ROUND(AVG(patient_satisfaction) 
OVER(PARTITION BY service 
	 ORDER BY week 
     ROWS BETWEEN 3 PRECEDING 
     AND CURRENT ROW ),0) AS mov_avg
FROM services_weekly
ORDER BY service, week;


-- ============================================================================
#Q3.Show cumulative patient refusals by week across all services.

SELECT service, week , 
patients_refused AS pat_ref,
SUM(patients_refused) 
OVER(ORDER BY week ) AS run_total
FROM services_weekly
ORDER BY week, pat_ref DESC
;



-- ============================================================================

# Question: Create a trend analysis showing for each service and week: 
# week number, patients_admitted, running total of patients admitted (cumulative), 
# 3-week moving average of patient satisfaction (current week and 2 prior weeks), 
# and the difference between current week admissions and the service average. 
# Filter for weeks 10-20 only.

SELECT service, week, patients_admitted AS pat_adm,
ROUND(AVG(patients_admitted) OVER(PARTITION BY service),0) AS avg_adm,
SUM(patients_admitted) 
OVER(PARTITION BY service ORDER BY week) AS run_total,
ROUND(AVG(patient_satisfaction) 
OVER(PARTITION BY service 
	 ORDER BY week 
     ROWS BETWEEN 2 PRECEDING 
     AND CURRENT ROW ),0) AS mov_avg,
(patients_admitted - 
	ROUND(AVG(patients_admitted) OVER(PARTITION BY service),0)
) AS Diff
FROM services_weekly
WHERE week BETWEEN 10 AND 20;


