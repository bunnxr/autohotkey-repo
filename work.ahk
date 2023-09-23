;bunnxr
#NoTrayIcon
#NoEnv
#SingleInstance, force
#Persistent
DetectHiddenWindows, On
SetTitleMatchMode, 2
SendMode Input

`::WinMinimize,A ;minimizes active window.
F1::Run, explorer.exe /root`,`,::{20D04FE0-3AEA-1069-A2D8-08002B30309D}

pause:: ;lockwindows
Suspend, Permit
DllCall("LockWorkStation")
Return
End::ExitApp