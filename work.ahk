/*
bunnxr
:*:vc:: for abbreviations
^ = Ctrl
# = Win
! = Alt
+ = Shift
*/
#NoTrayIcon
#NoEnv
#SingleInstance, force
#Persistent
DetectHiddenWindows, On
SetTitleMatchMode, 2
SendMode Input

`::WinMinimize,A ;minimizes active window.
F1::Run, explorer.exe /root`,`,::{20D04FE0-3AEA-1069-A2D8-08002B30309D}

LWin & WheelDown::SendInput {Ctrl down}{Lwin Down}{Right}{Lwin Up}{Ctrl Up} ;workspace down
Lwin & WheelUp::SendInput {Ctrl down}{Lwin Down}{Left}{Lwin Up}{Ctrl Up} ;workspace up

^#\::
Run, %USERPROFILE%\Documents\hellow.ahk,,UseErrorLevel
If ErrorLevel
    Return
^#E::
Run, %comspec% /c taskkill /f /im explorer.exe,,hide
Sleep, 400
Run, explorer.exe
Return
pause:: ;lockwindows
Suspend, Permit
DllCall("LockWorkStation")
Return
End::ExitApp