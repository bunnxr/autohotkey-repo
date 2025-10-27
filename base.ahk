;bunnxr
;AutoHotkey v1.1.32.00 - November 24, 2019
;# = Win, ! = Alt, ^ = Ctrl, + = Shift , & can be used combine two keys
#NoTrayIcon
#NoEnv
#SingleInstance, force
#Persistent
;#InstallKeybdHook
DetectHiddenWindows, On
SetTitleMatchMode, 2
SendMode Input
SetWorkingDir %A_ScriptDir%
;Control, Hide, , Start1, ahk_class Shell_TrayWnd  ;can hide windows start button logo
if !A_IsAdmin
{
    Run *RunAs "%A_AhkPath%" "%A_ScriptFullPath%"
    ;add "%A_AhkPath%" if there's .ahk
    ;WARNING:remove ahkpath if script is compiled
    ExitApp
}
{
    ;required at script startup
    Menu, Tray, NoStandard
    Menu, Tray, Add, Spy, Spy
    Menu, Tray, Add, MicID, MicID
    Menu, Tray, Add, Reload, ^#r
    Menu, Tray, Add, Terminate, ^#Delete
    GroupAdd, CHARLie, ahk_exe VALORANT-Win64-Shipping.exe
    GroupAdd, CHARLie, ahk_exe csgo.exe
    GroupAdd, cmd, ahk_exe cmd.exe
    GroupAdd, cmd, ahk_exe powershell.exe
    GroupAdd, cmd, ahk_exe parsecd.exe
    GroupAdd, discord, ahk_exe discord.exe
    GroupAdd, discord, ahk_exe discordcanary.exe
	Run, noeject.bat
}
Return

LWin & WheelDown::SendInput {Ctrl down}{Lwin Down}{Right}{Lwin Up}{Ctrl Up} ;workspace down
Lwin & WheelUp::SendInput {Ctrl down}{Lwin Down}{Left}{Lwin Up}{Ctrl Up} ;workspace up


~alt & 3::Send {alt down}{Numpad3}{alt up} ;valorant heart

^#E::
Run, %comspec% /c taskkill /f /im explorer.exe,,hide
Sleep, 400
Run, explorer.exe
Sleep, 6000
Run, C:\charlie\noeject.bat,,hide
Return

^#s::
Suspend, Permit
if A_IsSuspended
    Gosub, suspendoff
else
    Gosub, suspend
Return
^#r::
Suspend, Permit
Reload
Return
^#Delete::
Suspend, Permit
ExitApp, [ ExitCode]
Return