-- Attrition by Department
SELECT 
    e.Department,
    COUNT(*) AS total_employees,
    SUM(CASE WHEN a.Attrition_Flag = 1 THEN 1 END) AS exits,
    ROUND(
        SUM(CASE WHEN a.Attrition_Flag = 1 THEN 1 END) * 100.0 / COUNT(*),
        2
    ) AS attrition_rate
FROM employees e
LEFT JOIN attrition a
    ON e.EmployeeID = a.EmployeeID
GROUP BY e.Department
ORDER BY attrition_rate DESC;
