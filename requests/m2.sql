SELECT distinct pid from suppliers as sup join shipments using(sid) where sup.city = 'Paris' ;
