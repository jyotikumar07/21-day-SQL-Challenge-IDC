-------- Practice Questions Day2(11/04/2025)--------
-- 1.Find all patients who are older than 60 years.
	 SELECT * FROM patients WHERE age > 60;
  
-- 2.Retrieve all staff members who work in the emergency services.
	 SELECT staff_name, role, service FROM staff WHERE service = 'emergency';

-- 3.List all weeks where more than 100 patients requested admission in any service.
	 SELECT week, service FROM services_weekly WHERE patients_request > 100;

-------- Daily Challenge --------
-- Question: Find all the patients admitted to 'Surgery' service with a satisfaction 
--           score below 70, show their patient_id, name, age, and satisfaction score.
	SELECT patient_id, name, age, service, satisfaction FROM patients 
	WHERE service = 'surgery' AND satisfaction < 70;
 