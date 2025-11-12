-------- Practice Questions Day8 (11/11/2025)--------

-- 1.Convert all patient names to uppercase.

SELECT UPPER(name) AS uppercase_names FROM patients;

-- 2.Find the length of each staff member's name.

SELECT staff_name, LENGTH(staff_name) as name_length FROM staff;

-- 3.Concatenate staff_id and staff_name with a hyphen separator.

SELECT CONCAT(staff_id, ' - ', staff_name) as Staff_ID_Name FROM staff;


----------------- Daily Challenge -----------------

/*Question: Create a patient summary that shows patient_id, full name 
  in uppercase, service in lowercase, age category 
  (if age >= 65 then 'Senior', if age >= 18 then 'Adult', else 'Minor'), 
  and name length. Only show patients whose name length is 
  greater than 10 characters.   */
  
SELECT patient_id, 
	   UPPER(name) as patient_name, 
	   LOWER(service) as service_required,
CASE
	   WHEN age >= 65 THEN "Senior"
	   WHEN age>= 18 THEN "Adult"
	   ELSE "Minor"
END as age_category
FROM patients WHERE length(name)> 10;






