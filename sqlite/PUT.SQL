SELECT 
a.NOM,
b.TYPE,
a.ASSETNUM,
min(c.KM) as KMN,
min(c.KM*1000+c.BEGIN_M)-min(c.KM)*1000 as MN,
max(c.KM) as KME,
max(c.KM*1000+c.END_M)-max(c.KM)*1000 as ME

FROM 
WAY a
inner join SPR_WAY b on a.TYPE=b.ID 
inner join KM c on a.SITEID=c.SITEID and a.UP_NOM=c.UP_NOM and a.NOM=c.PUT_NOM 

WHERE 
a.SITEID=:SID
AND a.UP_NOM=:NAIM


group by
a.SITEID,
a.TYPE,
a.UP_NOM, 
a.NOM