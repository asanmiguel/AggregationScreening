function status=st_unload(Valve)

calllib('PacDrive_x64','PacSetLEDState',Valve.DevId,Valve.Entry,Valve.Closed);
calllib('PacDrive_x64','PacSetLEDState',Valve.DevId,Valve.Position,Valve.Closed);
calllib('PacDrive_x64','PacSetLEDState',Valve.DevId,Valve.WildType,Valve.Closed);
calllib('PacDrive_x64','PacSetLEDState',Valve.DevId,Valve.Mutant,Valve.Open);

calllib('PacDrive_x64','PacSetLEDState',Valve.DevId,Valve.Injection,Valve.Open);
calllib('PacDrive_x64','PacSetLEDState',Valve.DevId,Valve.InjectionPinch,Valve.Open);
calllib('PacDrive_x64','PacSetLEDState',Valve.DevId,Valve.Flushing,Valve.Closed);

status='Unloading Device';