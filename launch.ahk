#NoEnv
#SingleInstance, force
#Persistent
SendMode Input
SetTitleMatchMode, 2
SetTitleMatchMode, Slow
SetWorkingDir, D:\
DetectHiddenWindows, On
Menu, Tray, Icon, devop\icons\codeee.ico
GroupAdd, grp, ahk_exe GoogleDriveFS.exe
GroupAdd, grp, ahk_exe discord.exe
GroupAdd, grp, ahk_exe parsecd.exe
location = C:\Users\CHARLie\AppData\Roaming\Microsoft\Windows\Start Menu\Programs

IfWinNotExist, ahk_exe parsecd.exe
    Run, *RunAs devop\parsec.lnk
IfWinNotExist, ahk_exe GoogleDriveFS.exe
    Run, %location%\drv.lnk
GetKeyState, rg, CapsLock
if (rg = "D")
    Run devop\launchahk.bat
GetKeyState, rg, LShift
if (rg = "D")
    Run haves\vscode\code.exe
IfWinExist, ahk_exe discord.exe
    gosub Exit
Else
    Run, *RunAs %location%\ds.lnk,,hide
Sleep, 800
WinWaitActive, ahk_exe discord.exe
    WinMinimize ahk_exe discord.exe
Winwait, Friends - Discord
    WinClose
Exit:
ExitApp, [ ExitCode]