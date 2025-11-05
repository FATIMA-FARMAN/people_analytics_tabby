-- Performance vs Engagement correlation by Department (SQLite version)
WITH stats AS (
    SELECT
        Department,
        AVG(Performance_Score) AS avg_perf,
        AVG(Engagement_Score) AS avg_eng
    FROM performance_data
    GROUP BY Department
),
calc AS (
    SELECT
        p.Department,
        ROUND(AVG(p.Performance_Score), 2) AS avg_performance,
        ROUND(AVG(p.Engagement_Score), 2) AS avg_engagement,
        ROUND(
            (
                SUM(
                    (p.Performance_Score - s.avg_perf) *
                    (p.Engagement_Score - s.avg_eng)
                )
            ) /
            (
                SQRT(SUM((p.Performance_Score - s.avg_perf)*(p.Performance_Score - s.avg_perf))) *
                SQRT(SUM((p.Engagement_Score - s.avg_eng)*(p.Engagement_Score - s.avg_eng)))
            ),
        3) AS perf_eng_corr
    FROM performance_data p
    JOIN stats s ON p.Department = s.Department
    GROUP BY p.Department
)
SELECT * FROM calc
ORDER BY perf_eng_corr DESC;
