#NoEnv
#SingleInstance, force
#Persistent
SendMode Input
SetTitleMatchMode, 2
SetTitleMatchMode, Slow
SetWorkingDir, D:\
DetectHiddenWindows, On
Menu, Tray, Icon, devop\icons\codeee.ico
if !A_IsAdmin
{
    Run *RunAs "%A_AhkPath%" "%A_ScriptFullPath%"
    ;add "%A_AhkPath%" if there's .ahk
    ;WARNING:remove ahkpath if script is compiled
    ExitApp
}
Run, *RunAs devop\bunnxr.ahk(elevated).lnk,,Hide
Run, devop\noeject.bat,,hide
GetKeyState, str, CapsLock
if (str = "D")
    gosub secondexit
IfWinNotExist, ahk_exe D:\parsec\parsecd.exe
    Run, *RunAs devop\parsec.lnk,,hide
    WinWait, Parsec
        Winclose
IfWinNotExist, ahk_exe GoogleDriveFS.exe
    Run, C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Google Drive.lnk,,hide
GetKeyState, rg, l
if (rg = "D")
    Run devop\launchahk.bat
GetKeyState, rg, LShift
if (rg = "D")
    Run haves\vscode\code.exe
IfWinExist, ahk_exe discord.exe
    gosub Exit
Else
    Run, %A_Programs%\ds.lnk,,hide
Sleep, 1000
WinWaitActive, ahk_exe discord.exe
    WinMinimize ahk_exe discord.exe
Winwait, Friends - Discord
    WinClose
Exit:
ExitApp, [ ExitCode]
Return
secondexit:
SplashTextOn,,, Omitting the launch..
Sleep, 2000
Run, %comspec% /c taskkill /f /im msedge.exe,,hide
gosub, Exit