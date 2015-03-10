select sid,name,status from suppliers where sid not in (select distinct sid from shipments);
