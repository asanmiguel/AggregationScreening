function status=st_speed_loading(Valve)

calllib('PacDrive','PacSetLEDState',Valve.DevId,Valve.Entry,Valve.Closed);
calllib('PacDrive','PacSetLEDState',Valve.DevId,Valve.Position,Valve.Closed);
calllib('PacDrive','PacSetLEDState',Valve.DevId,Valve.WildType,Valve.Closed);
calllib('PacDrive','PacSetLEDState',Valve.DevId,Valve.Mutant,Valve.Open);

calllib('PacDrive','PacSetLEDState',Valve.DevId,Valve.Injection,Valve.Open);
calllib('PacDrive','PacSetLEDState',Valve.DevId,Valve.InjectionPinch,Valve.Open);
calllib('PacDrive','PacSetLEDState',Valve.DevId,Valve.Flushing,Valve.Closed);

status='Speed Loading';