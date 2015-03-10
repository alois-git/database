

SELECT distinct sid FROM shipments AS ship1
WHERE NOT EXISTS (
SELECT * FROM parts AS part
WHERE NOT EXISTS (
SELECT * FROM shipments AS ship2
WHERE ship2.sid = ship1.sid
AND ship2.pid = part.pid ) )
