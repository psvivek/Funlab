-- Common Table Expression to assign row numbers to each record in the login_details table
WITH RankedLogins AS (
    SELECT 
        TIMES,
        STATUS,
        ROW_NUMBER() OVER (ORDER BY TIMES) AS rn
    FROM 
        login_details
), 
-- CTE to pair logon and logoff events
PairedLogins AS (
    SELECT 
        l1.TIMES AS LOG_ON,
        MIN(l2.TIMES) AS LOG_OFF
    FROM 
        RankedLogins l1
    LEFT JOIN 
        RankedLogins l2 ON l1.rn < l2.rn AND l2.STATUS = 'off'
    WHERE 
        l1.STATUS = 'on'
        AND (l2.TIMES IS NULL OR l2.TIMES > l1.TIMES)
    GROUP BY 
        l1.TIMES
), 
-- CTE to order logon and logoff pairs by LOG_ON time and assign row numbers
OrderedPairedLogins AS (
    SELECT 
        LOG_ON,
        LOG_OFF,
        ROW_NUMBER() OVER (ORDER BY LOG_ON) AS rn
    FROM 
        PairedLogins
)
-- Final query to calculate the duration between logon and logoff times
SELECT 
    opl.LOG_ON,
    opl.LOG_OFF,
    DATEDIFF(MINUTE, opl.LOG_ON, opl.LOG_OFF) AS DURATION
FROM 
    OrderedPairedLogins opl
-- Join condition to ensure that the LOG_ON time is greater than the previous LOG_OFF time
LEFT JOIN 
    OrderedPairedLogins opl_prev ON opl.rn = opl_prev.rn + 1
WHERE 
    opl_prev.LOG_OFF IS NULL OR opl.LOG_ON > opl_prev.LOG_OFF;
