WITH DATE_TABLE AS (
    SELECT CAR_ID, START_DATE AS S_D, END_DATE AS E_D
    FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY 
    WHERE "2022-10-16" BETWEEN START_DATE AND END_DATE
    GROUP BY 1
    ORDER BY 1),
    
    CAR_ID_TABLE AS(
    SELECT CAR_ID
    FROM CAR_RENTAL_COMPANY_RENTAL_HISTORY 
    GROUP BY 1
    ORDER BY 1)
    
SELECT CAR_ID, 
    CASE
    WHEN CAR_ID IN (SELECT CAR_ID FROM DATE_TABLE) THEN "대여중"
    ELSE "대여 가능"
    END AS AVAILABILITY
FROM CAR_ID_TABLE 
ORDER BY CAR_ID DESC

