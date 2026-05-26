SELECT * FROM thermography_report.report;

SELECT Defect, Count(sr_no) AS 'Total Modules'
FROM thermography_report.report
GROUP BY Defect
ORDER BY Defect DESC
;

SELECT COUNT(*) AS total_modules
FROM thermography_report.report;

SELECT Make, COUNT(*) AS total_modules
FROM thermography_report.report
GROUP BY Make
ORDER BY total_modules DESC;


SELECT Taarekh,
       COUNT(*) AS total_checked
FROM thermography_report.report
GROUP BY Taarekh
ORDER BY Taarekh DESC;

SELECT block_no,
       COUNT(*) AS total_modules
FROM thermography_report.report
GROUP BY block_no
ORDER BY total_modules DESC;

SELECT *
FROM thermography_report.report
WHERE VOC < 35;

SELECT module_no,
       COUNT(*) AS total
FROM thermography_report.report
GROUP BY module_no
HAVING COUNT(*) > 1;

SELECT module_no,
       COUNT(*) AS total
FROM thermography_report.report
GROUP BY module_no
HAVING COUNT(*) > 1;

SELECT block_no,
       table_no,
       module_no,
       VOC,
       ISC,
       Minimum_Temp
FROM thermography_report.report
WHERE module_no = '(2,22)';

SELECT WP,
       COUNT(*) AS total_modules
FROM thermography_report.report
GROUP BY WP
ORDER BY total_modules DESC;

SELECT corrective_action,
       COUNT(*) AS total
FROM thermography_report.report
GROUP BY corrective_action
HAVING COUNT(*) > 5;

WITH weak_modules AS
(
    SELECT module_no,
           VOC,
           ISC
    FROM thermography_report.report
    WHERE VOC < 40
    AND ISC < 8
)

SELECT *
FROM weak_modules;

WITH performance AS
(
    SELECT Make,
           ROUND(AVG(VOC),2) AS avg_voc,
           ROUND(AVG(ISC),2) AS avg_isc
    FROM thermography_report.report
    GROUP BY Make
)

SELECT *
FROM performance
WHERE avg_voc > 35
AND avg_isc > 5;

WITH daily_report AS
(
    SELECT Taarekh,
           COUNT(*) AS total_modules
    FROM thermography_report.report
    GROUP BY Taarekh
)

SELECT *
FROM daily_report
ORDER BY total_modules DESC;

WITH block_performance AS
(
    SELECT block_no,
           ROUND(AVG(VOC),2) AS avg_voc,
           ROUND(AVG(ISC),2) AS avg_isc
    FROM thermography_report.report
    GROUP BY block_no
)

SELECT *
FROM block_performance
WHERE avg_voc < 37
AND avg_isc < 8;

WITH action_summary AS
(
    SELECT corrective_action,
           COUNT(*) AS total
    FROM thermography_report.report
    GROUP BY corrective_action
)

SELECT *
FROM action_summary
WHERE total > 10;

WITH block_summary AS
(
    SELECT block_no,
           COUNT(*) AS total_modules,
           ROUND(AVG(VOC),2) AS avg_voc
    FROM thermography_report.report
    GROUP BY block_no
    HAVING COUNT(*) > 50
)

SELECT *
FROM block_summary
WHERE avg_voc > 37;

SELECT 
    block_no,
    module_no,
    VOC,
    RANK() OVER(
        PARTITION BY block_no
        ORDER BY VOC DESC
    ) AS voc_rank
FROM thermography_report.report;