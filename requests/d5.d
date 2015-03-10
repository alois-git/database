SUMMARIZE (SUMMARIZE PARTS BY {CITY} :{ sd:=count(), total:=SUM(0),ss:=SUM(0) }
UNION
SUMMARIZE (SUMMARIZE SHIPMENTS PER ( SUPPLIERS{SID,CITY} ) : {total:=SUM(QTY)}) BY {CITY} :{ total:=SUM(total), ss:=count(), sd:=SUM(0)}) BY {CITY} : {total:=SUM(total), ss:=SUM(ss), sd:=SUM(sd)}

