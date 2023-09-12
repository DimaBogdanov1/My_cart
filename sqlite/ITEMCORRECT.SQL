SELECT 
COUNT (KM) as CL

FROM 
KM

WHERE 
SITEID=:sit and 
UP_NOM=:upn and 
PUT_NOM=:ptn and
KM=:km and (BEGIN_M<=:m and END_M>=:m)