-- ----------------- Practice Questions Day 11(11/14/2025)---------------------
-- 1. Find all weeks in services_weekly where no special event occurred.
SELECT week, month FROM services_weekly 
WHERE event ="none" OR event IS NULL;

-- 2. Count how many records have null or empty event values.

SELECT COUNT(*) AS rows_withNULL FROM services_weekly 
WHERE event = "None" OR event IS NULL;

-- 3. List all services that had at least one week with a special event.

SELECT service, COUNT(week) AS weeks_withevents FROM services_weekly 
WHERE event <> "none" AND event IS NOT NULL GROUP BY service;



-- -------------- Daily Challenge -----------------
/* Question: Analyze the event impact by comparing weeks with events vs weeks 
   without events. Show: event status ('With Event' or 'No Event'), 
   count of weeks, average patient satisfaction, and average staff morale. 
   Order by average patient satisfaction descending.    */



SELECT CASE 
			WHEN event <> 'none' AND event IS NOT NULL
            THEN "With Event"
            WHEN event = 'none' OR event IS NULL
            THEN "Without Event"
	   END AS event_status,
	  COUNT(week) AS total_week, 
      ROUND(AVG(patient_satisfaction),0) AS avg_satisfaction,
	  ROUND(AVG(staff_morale),0) AS avg_morale	
FROM services_weekly
GROUP BY event_status;
		
        
        
        
        
        
        
        




         
         