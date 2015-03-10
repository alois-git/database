select distinct sup.sid, name, status, city from shipments as ship join suppliers as sup on ship.sid = sup.sid
