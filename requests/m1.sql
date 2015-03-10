SELECT SUM(qty) from shipments join parts using (pid) where sid = 'S1';
