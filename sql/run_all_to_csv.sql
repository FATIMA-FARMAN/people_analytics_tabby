.mode csv

.output reports/attrition_summary.csv
.read sql/attrition_trends.sql
.output stdout

.output reports/hiring_summary.csv
.read sql/hiring_kpis.sql
.output stdout

.output reports/performance_summary.csv
.read sql/performance_analysis.sql
.output stdout
