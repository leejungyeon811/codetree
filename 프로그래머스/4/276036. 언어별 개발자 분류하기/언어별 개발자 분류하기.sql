# A : Front End 스킬과 Python 스킬을 함께 가지고 있는 개발자
# B : C# 스킬을 가진 개발자
# C : 그 외의 Front End 개발자

WITH A_TABLE AS(
    SELECT BIT_OR(CODE) AS CODE
    FROM SKILLCODES
    WHERE CATEGORY="Front End"
),

A_PYTHON AS(
    SELECT CODE
    FROM SKILLCODES
    WHERE NAME="Python"
),

B_TABLE AS(
    SELECT CODE
    FROM SKILLCODES 
    WHERE NAME="C#"),
    
C_TABLE AS(
    SELECT BIT_OR(CODE) AS CODE
    FROM SKILLCODES
    WHERE CATEGORY="Front End")

SELECT 
    *
FROM (
    SELECT
        CASE
        WHEN SKILL_CODE&(SELECT CODE FROM A_TABLE) > 0
            AND SKILL_CODE&(SELECT CODE FROM A_PYTHON) > 0
        THEN "A"
        WHEN SKILL_CODE&(SELECT CODE FROM B_TABLE) > 0
        THEN "B"
        WHEN SKILL_CODE&(SELECT CODE FROM C_TABLE) > 0
        THEN "C"
        ELSE NULL
        END AS GRADE,
        ID, EMAIL
    FROM DEVELOPERS) D
WHERE GRADE IS NOT NULL
ORDER BY GRADE, ID