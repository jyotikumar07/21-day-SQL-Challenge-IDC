# ============================================================================
# Q1.Combine patient names and staff names into a single list.

SELECT name AS name, 
"patient" AS category 
FROM patients
UNION ALL 
SELECT staff_name  AS name, 
"staff" AS category 
FROM staff;

-- ============================================================================

# Q2.Create a union of high satisfaction patients (>90) and low satisfaction 
# patients (<50).

SELECT satisfaction, 
"High" AS level 
FROM patients 
WHERE satisfaction >90
UNION ALL
SELECT satisfaction, 
"Low" AS level 
FROM patients 
WHERE satisfaction <50;



# ============================================================================

# Q3.List all unique names from both patients and staff tables.

SELECT name AS unique_name, 
"patient" AS category 
FROM patients
UNION  
SELECT staff_name AS unique_name, 
"staff" AS category 
FROM staff;



# ============================================================================

# Question: Create a comprehensive personnel and patient list showing: 
# identifier (patient_id or staff_id), full name, type ('Patient' or 'Staff'), 
# and associated service. Include only those in 'surgery' or 'emergency' services.
# Order by type, then service, then name.



SELECT patient_id, 
name AS full_name, 
"patient" AS category,
service
FROM patients
WHERE service = "surgery" OR "emergency " 
UNION ALL 
SELECT staff_id, 
staff_name AS full_name, 
"staff" AS category,
service
FROM staff
WHERE service = "surgery" OR "emergency " ;
