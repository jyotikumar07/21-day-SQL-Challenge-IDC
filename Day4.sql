-------- Practice Questions Day4(11/062025)--------

-- 1.Display the first 5 patients from the patients table.
SELECT * FROM patients ORDER BY arrival_date LIMIT 5 OFFSET 0;

-- 2.Show patients 11-20 using offset.
SELECT * FROM patients ORDER BY arrival_date LIMIT 10 OFFSET 10;

-- 3.Get the 10 most recent patient addmission based on arrival_date.
SELECT * FROM patients ORDER BY arrival_date DESC LIMIT 10;


----------------- Daily Challenge -----------------
/* Question: Find the 3rd to 7th highest patient satisfaction scores
	from the patients table, showing patient id,name,service,and satisfaction.
    Display only these 5 records. */
    
SELECT patient_id,name,service,satisfaction FROM patients
ORDER BY satisfaction DESC LIMIT 5 OFFSET 2;


