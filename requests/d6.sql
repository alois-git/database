﻿select distinct * from parts where weight >= (select distinct MAX(weight) from parts) and NAME = (select distinct min(NAME) from parts where weight >= (select distinct MAX(weight) from parts))