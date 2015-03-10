(select pid from parts) EXCEPT (select distinct pid from suppliers as sup join shipments as ship using(sid) join parts as part using (pid) where sup.city = 'Paris')
