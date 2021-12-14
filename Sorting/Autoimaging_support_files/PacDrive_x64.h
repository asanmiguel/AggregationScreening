// PacDrive.h header file.
#ifdef PACDRIVE_EXPORTS
#define PACDRIVE_API __declspec(dllexport)
#else
#define PACDRIVE_API __declspec(dllimport)
#endif

PACDRIVE_API int __stdcall PacInitialize();
PACDRIVE_API void __stdcall PacShutdown();
PACDRIVE_API bool __stdcall PacSetLEDStates(int id, int data);
PACDRIVE_API bool __stdcall PacSetLEDState(int id, int port, bool state);
PACDRIVE_API int __stdcall PacGetVendorId(int id);
PACDRIVE_API int __stdcall PacGetProductId(int id);
PACDRIVE_API int __stdcall PacGetVersionNumber(int id);
PACDRIVE_API void __stdcall PacGetVendorName(int id, char sVendorName);
PACDRIVE_API void __stdcall PacGetProductName(int id, char sProductName);
PACDRIVE_API void __stdcall PacGetSerialNumber(int id, char sSerialNumber);
PACDRIVE_API void __stdcall PacGetDevicePath(int id, char sDevicePath);
// PACDRIVE_API bool __stdcall PacProgramUHid(int id, char sFilePath);
