select city,SUM(total) as total, SUM(sd) as sd, SUM(ss) as ss from ((select city,sum(total) as total, count(*) as ss, 0 as sd from (SELECT sid,city,(select sum(QTY) from shipments where sup.sid = sid) as total from suppliers as sup WHERE exists (SELECT * FROM shipments
WHERE sup.sid = sid ) 
UNION
SELECT sid, city,0 as total
FROM suppliers AS sup WHERE NOT EXISTS (
SELECT * FROM shipments
WHERE sup.sid = sid )) as temp1 group by city)
UNION
SELECT city,0 as total, 0 as ss, count(*) as sd from parts group by city)  as temps2 group by city