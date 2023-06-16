#Persistent
#InstallKeybdHook	;Hooks required to get A_TimeIdlePhysical
#InstallMouseHook

;Period of Inactivity in minutes after which to display the message
InactivityPeriod_mins=5

;Time in seconds to display the prompt after which the display is locked
PromptPeriod_secs=5

; Do not change anything else if you are not sure
If !InactivityPeriod_mins < 5
{	MsgBox,64,Error in settings,Inactivity period is set below 5 mins! Exiting...,5
	ExitApp
}
If PromptPeriod_secs < 5
{	MsgBox,64,Error in settings,Time to display prompt is set below 5 secs! Exiting...,5
	ExitApp
}
SetTimer,CheckPeriod,1000
Return

CheckPeriod:
If (A_TimeIdlePhysical >= InactivityPeriod_mins*60*1000)
{	SetTimer,LockPC,% PromptPeriod_secs*1000
	SetTimer,OKtoCancel,100
	MsgBox,16,%InactivityPeriod_mins% minutes of inactivity, This computer will lock in %PromptPeriod_secs% seconds...
}
Return

LockPC:
SetTimer,LockPC,off
IfWinExist,%InactivityPeriod_mins% minutes of inactivity
{	WinActivate
	Sleep 100
	Run,%A_WinDir%\System32\Rundll32.exe User32.dll`,LockWorkStation
	Sleep 1000
	WinWaitActive
	WinClose
}
Return

OKtoCancel:
SetTimer,OKtoCancel,off
ControlSetText,OK,Cancel,%InactivityPeriod_mins% minutes of inactivity
Return