RAlt & 1:: 
ChangeResolution(32,1366,768,60) 
return 

RAlt & 2:: 
ChangeResolution(32,1024,768,75) 
return 

RAlt & 3:: 
ChangeResolution(32,1280,720,75) 
return 

RAlt & 4:: 
ChangeResolution(32,1920,1080,60) 
return 

ChangeResolution( cD, sW, sH, rR ) 
{ 
    VarSetCapacity(dM,156,0), NumPut(156,2,&dM,36) 
    DllCall( "EnumDisplaySettingsA", UInt,0, UInt,-1, UInt,&dM ), 
    NumPut(0x5c0000,dM,40)
    NumPut(cD,dM,104), NumPut(sW,dM,108), NumPut(sH,dM,112), NumPut(rR,dM,120) 
    Return DllCall( "ChangeDisplaySettingsA", UInt,&dM, UInt,0 ) 
}