SELECT COUNT(*) AS COUNT
FROM ECOLI_DATA
WHERE
    2!=(GENOTYPE&2)
    AND (1=(GENOTYPE&1) OR 4=(GENOTYPE&4))