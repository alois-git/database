COUNT((EXTEND SUPPLIERS : { PARTSHIPED := ( SHIPMENTS JOIN RELATION { TUPLE { SID SID } } ) } { SID, PARTSHIPED}) WHERE PARTSHIPED{PID} = PARTS{PID})
