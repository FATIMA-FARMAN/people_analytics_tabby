-- Hiring Efficiency Metrics
SELECT Department,
       COUNT(EmployeeID) AS total_hires,
       ROUND(AVG(Time_to_Fill_Days),2) AS avg_time_to_fill,
       SUM(Cost_to_Hire) AS total_cost
FROM hiring_data
GROUP BY Department;