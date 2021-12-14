function status=st_wt_flushing(Valve)

calllib('PacDrive','PacSetLEDState',Valve.DevId,Valve.Entry,Valve.Open);
calllib('PacDrive','PacSetLEDState',Valve.DevId,Valve.Position,Valve.Closed);
calllib('PacDrive','PacSetLEDState',Valve.DevId,Valve.WildType,Valve.Closed);
calllib('PacDrive','PacSetLEDState',Valve.DevId,Valve.Mutant,Valve.Open);

calllib('PacDrive','PacSetLEDState',Valve.DevId,Valve.Injection,Valve.Open);
calllib('PacDrive','PacSetLEDState',Valve.DevId,Valve.InjectionPinch,Valve.Closed);
calllib('PacDrive','PacSetLEDState',Valve.DevId,Valve.Flushing,Valve.Open);

status='Flushing WT';