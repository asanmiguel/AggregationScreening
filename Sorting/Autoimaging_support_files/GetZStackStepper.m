function [trld rgiZStackImage time_elapsed] = GetZStackStepper(CDevices,CCam,CStageSettings)
%% Filename:    get_zstack.m
% Date: 	    2007-12-05
% Author(s):    Matt Crane      (mcrane6@mail.gatech.edu)
%               Ivan Caceres    (ivan.caceres@gmail.com)
% Description: 	Acquire zstack of images from the camera based on the
%               uiZHeight and the number of uiFocalPlaneNumber specified by the user
% Requires:     initialize.m
% Parameters:   CDevices - class containing pointers to all peripheral
%                          devices
%               CStageSettings - class containing settings for the stage
%               udExposureTime - exposure time value set for camera in
%                                intialize.m
% Returns:      rgiZStackImage - array of digitial values representing the
%                                various 2D images grabbed of the worm from
%                                different focal planes
% Debug Codes:  81 - 90
%               81:  Number of arguments invalid
%               82:  Debug code explanation
%               83:  Debug code explanation
%               84:  Debug code explanation
%               85:  Debug code explanation
%               86:  Debug code explanation
%               87:  Debug code explanation
%               88:  Debug code explanation
%               89:  Debug code explanation
%               90:  Debug code explanation
% Change Log:
%               Version:        1.1
%               Editor:         Matt Crane
%               Date Edited:    1-4-08    
%               Changes:        Editted for speed and to remove extraneous
%                               information
%               Version         2
%               Editor          Adriana San Miguel, 02/2012

%% Input Argument Check
% error('E81 - %s',nargchk(3,3,nargin));

%% Variable Declaration
tic
CStageSettings.uiStepSize=floor(CStageSettings.uiStepSize/CDevices.zconv);
CStageSettings.uiZHeight=CStageSettings.uiZHeight;

% uiZTravelDistance = floor(CStageSettings.uiZHeight*CStageSettings.uiStepSize); 
uiFocalPlanesNumber = CStageSettings.uiZHeight;
% strZTravelDistance = strcat('71024 -',int2str(uiZTravelDistance)) ;% create command string to be sent to stage through serial port

% fprintf(CDevices.pSerial,strZTravelDistance);
% fscanf(CDevices.pSerial);
% pause(0.02*CStageSettings.uiZHeight);
iWidth = 1280;
iHeight = 480;
rgiZStackImage=uint16(zeros(iHeight*2,iWidth,uiFocalPlanesNumber));

%% Get Z Stack
% Incrementally move stage uiStepSize microns per step and grab an image of
% the corresponding focal plane.  

uiZTravelDistance = CStageSettings.uiStepSize;
% strZTravelDistance = strcat('71024 +',int2str(uiZTravelDistance));
strZTravelDistance = strcat('71024 -',int2str(uiZTravelDistance));
k=0;
for i=1:uiFocalPlanesNumber
    fprintf(CDevices.pSerial,strZTravelDistance);
    fscanf(CDevices.pSerial);
    rgiZStackImage(1:480,:,i)= getsnapshot(CCam.pCam1);
    rgiZStackImage(481:end,:,i)= getsnapshot(CCam.pCam2);
    k=k+str2num(int2str(uiZTravelDistance));

end
k;
trld=CStageSettings.uiStepSize;
%% Zero Stage Position
% Zero the stage position and read serial port to clear RX buffer

uiZTravelDistance = floor(CStageSettings.uiZHeight*CStageSettings.uiStepSize); 
uiFocalPlanesNumber = CStageSettings.uiZHeight;
strZTravelDistance = strcat('71024 +',int2str(uiZTravelDistance)) ;% create command string to be sent to stage through serial port

fprintf(CDevices.pSerial,strZTravelDistance);
fscanf(CDevices.pSerial);
pause(0.02*CStageSettings.uiZHeight);


% uiZTravelDistance = uiFocalPlanesNumber*CStageSettings.uiStepSize-floor(uiFocalPlanesNumber/2*CStageSettings.uiStepSize);  
% uiZTravelDistance = floor(CStageSettings.uiZHeight*CStageSettings.uiStepSize)-uiFocalPlanesNumber*CStageSettings.uiStepSize  

% strZTravelDistance = strcat('71024 +',int2str(uiZTravelDistance));  % create command string to be sent to stage through serial port
% fprintf(CDevices.pSerial,strZTravelDistance);
% fscanf(CDevices.pSerial);
time_elapsed=toc;
