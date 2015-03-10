SELECT sid, sum(QTY)
FROM shipments GROUP BY sid
UNION
SELECT sid, 0
FROM suppliers AS sup WHERE NOT EXISTS (
SELECT * FROM shipments
WHERE sid = sup.sid )