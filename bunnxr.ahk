﻿;tanuj accha aadmi hai
;bunnxr
;AutoHotkey v1.1.32.00 - November 24, 2019
;# = Win, ! = Alt, ^ = Ctrl, + = Shift , & can be used combine two keys
;#NoTrayIcon
#NoEnv
#SingleInstance, force
#Persistent
;#InstallKeybdHook
DetectHiddenWindows, On
SetTitleMatchMode, 2
SendMode Input
SetWorkingDir D:\ 
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
    Menu, Tray, Add, Ahk2exe, Compiler
    Menu, Tray, Add, DrvCache, drivecache
    Menu, Tray, Add, Reload, ^#r
    Menu, Tray, Add, Terminate, #Delete
    GroupAdd, CHARLie, ahk_exe VALORANT-Win64-Shipping.exe
    GroupAdd, CHARLie, ahk_exe csgo.exe
    GroupAdd, cmd, ahk_exe cmd.exe
    GroupAdd, cmd, ahk_exe powershell.exe
    GroupAdd, cmd, ahk_exe parsecd.exe
    GroupAdd, discord, ahk_exe discord.exe
    GroupAdd, discord, ahk_exe discordcanary.exe
    micid = 6
    appvol := spotify
    procu = Discord
    gosub seticon
}
Return
#Include, %A_scriptdir%\ahkmenu.txt
#Include, %A_scriptdir%\mymicmute.ahk
;#Include, %A_ScriptDir%\takefile.ahk

caps:
~$Capslock Up::SetCapsLockState, Off ;disabling caps and instead using it as a key
+$CapsLock Up::SetCapsLockState % !GetKeyState("CapsLock", "T")

;$Pause:: ;lockwindows
Suspend, Permit
DllCall("LockWorkStation")
Return

~AppsKey::Send, ^!g ;drive search

LWin & WheelDown::SendInput {Ctrl down}{Lwin Down}{Right}{Lwin Up}{Ctrl Up} ;workspace down
Lwin & WheelUp::SendInput {Ctrl down}{Lwin Down}{Left}{Lwin Up}{Ctrl Up} ;workspace up

#IfWinNotActive, ahk_group CHARLie
`::WinMinimize,A ;minimizes active window.
F1::Run, explorer.exe /root`,`,::{20D04FE0-3AEA-1069-A2D8-08002B30309D}
;\\?\Volume{0215518d-0000-0000-0000-100000000000}\
F3::Run C:\Users\%A_UserName%\AppData ;appdata
F4::Run D:\Drive\My Drive
#space::gosub com
#IfWinNotActive

com:
InputBox, kill3, com, , ,190,106 ;1650,40
if (kill3 = "aot")
    gosub aot
if (kill3 = "work")
    gosub work
if (kill3 = "play")
    gosub play
if (kill3 = "gpt")
    run, https://chatgpt.com/?temporary-chat=true
if (kill3 = "wait")
    InputBox, kill3, com, , ,190,106
else
    Run, %comspec% /c taskkill /f /im %kill3%.exe,,hide
Return

pause:: ;suspend specific
InputBox, procu, SuspendIO,, ,190,106
Toggle := !Toggle
If Toggle
    Run *RunAs @charlie\suspend.exe %procu%,, Hide
else
    Run *RunAs @charlie\suspend.exe -r %procu%,, Hide
return
F7::
Toggle := !Toggle
If Toggle
    Gosub, Slowdown
else
    Gosub, Slowup
return
F12:: ;mute current windowF
WinGet, WinProcessName, ProcessName, A
If (WinProcessName = "VALORANT-Win64-Shipping.exe")
{
    WinGet, valID, PID, ahk_exe VALORANT-Win64-Shipping.exe
    WinProcessName = /%valID%
}
Run, *RunAs @charlie\nirc.exe muteappvolume %WinProcessName% 2,,hide
Return
F13::gosub aot

~LAlt & `::SendInput {``} ;sending the grace accent as it was muted
 
MEDIAKEYS:
#space::
SendInput, {Media_Play_Pause}
Return
RShift & PgUp::SendInput, {Media_Next}
RShift & PgDn::SendInput, {Media_Prev}
~F8 & WheelUp::SendEvent, {Volume_Up}
~F8 & WheelDown::SendEvent, {Volume_Down}

~Capslock & home:: ;discord deafen
Send, ^+!d
gosub home
Return

#IfWinActive ahk_exe code.exe
XButton1::SendInput, ^+{.} ;breadcrumbs vscode
#IfWinActive

#IfWinActive ahk_group discord
dimscord:

:*?:yuro::`:yoru`:{enter}
:*?:vc::<{`#}961579220595781644>
:*?:2vc::<{`#}993475685660241972>
:*?:itlic::**{left}
:*?:bld::****{left}{left}
:*?:strk::~~~~{left}{left}
:*?:`(::`(`){left}

AppsKey::Send ^g
~Capslock::Send, ^k
Tab::Send, {Ctrl Down}{i}{Ctrl Up}
#IfWinActive

#IfWinActive ahk_exe parsecd.exe
parsec:
~CapsLock & d::
Send, ^!{d}
KeyWait, CapsLock
Keywait, d, D
Winclose
Return
~CapsLock & q::
Send, ^+{i}
Return
~CapsLock & w::
Send, ^+{w}
Return
#IfWinActive
~CapsLock & Enter::
SendInput, ^{F1} ;sends accept all to parsec
Return
~CapsLock & x::
SendInput, ^{F3} ;sends kick all to parsec
Return

#IfWinActive ahk_exe valheim.exe
[::
DllCall("mouse_event", uint, 2, int, x, int, y, uint, 0, int, 0)
Return
]::
DllCall("mouse_event", uint, 4, int, x, int, y, uint, 0, int, 0)
Return
g:
DllCall("mouse_event", "UInt", 0x08)
Sleep 30
Dllcall("keybd_event", int, 32, int, 57, int, 0, int, 0)
Sleep 40
DllCall("mouse_event", "UInt", 0x10)
Sleep 40
Dllcall("keybd_event", int, 32, int, 57, int, 2, int, 0)
Return
#IfWinActive

#IfWinActive ahk_exe spotify.exe
Up::^Up
Down::^Down
Right::^Right
Left::^Left
#IfWinActive

#IfWinActive ahk_class #32770
:*?:gpt::gpt{enter}
:*?:play::play{enter}
:*?:work::work{enter}
:*?:aot::aot{enter}
:*?:wait::wait{enter}
:*?:pars::parsecd{enter}
:*?:code::code{enter}
:*?:drv::GoogleDriveFS{Enter}
:*?:ds::discord{Enter}
:*?:spot::spotify{enter}
:*?:edge::msedge{enter}
:*?:valo::VALORANT-Win64-Shipping{enter}
:*?:faz::faz{enter}
:*?:wano::wano{enter}
:*?:stop::stop{enter}
#IfWinActive

/*
dll mouseclick and pos
DllCall("SetCursorPos", "int", 1515, "int", 841)
DllCall("mouse_event", uint, 2, int, x, int, y, uint, 0, int, 0)
DllCall("mouse_event", uint, 4, int, x, int, y, uint, 0, int, 0)
*/

;Insert:: ;task killer
~alt & 3::Send {alt down}{Numpad3}{alt up} ;valorant heart

slowdown:
Run, *RunAs @charlie\nirc.exe changeappvolume "Spotify.exe" 1,,hide
Run, *RunAs @charlie\nirc.exe changeappvolume "msedge.exe" 1,,hide
Loop, 9
{
    Run, *RunAs @charlie\nirc.exe changeappvolume "Spotify.exe" -0.1,,hide
    Run, *RunAs @charlie\nirc.exe changeappvolume "msedge.exe" -0.1,,hide
    Sleep, 65
}
Return
Slowup:
Loop, 9
{
    Run, *RunAs @charlie\nirc.exe changeappvolume "Spotify.exe" 0.1,,hide
    Run, *RunAs @charlie\nirc.exe changeappvolume "msedge.exe" 0.1,,hide
    Sleep, 65
}
Return

work:
Send, #4
Send, #1
Run, devop\ds.lnk
Return

play:
Run, %comspec% /c taskkill /f /im msedge.exe,,hide
Run, %comspec% /c taskkill /f /im parsecd.exe,,hide
Run, %comspec% /c taskkill /f /im code.exe,,hide
Run, %comspec% /c taskkill /f /im discord.exe,,hide
Return

^#E::
Run, %comspec% /c taskkill /f /im explorer.exe,,hide
Sleep, 400
Run, explorer.exe
Sleep, 6000
Run, devop\noeject.bat,,hide
Return

^#/::
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
#Delete::
Suspend, Permit
ExitApp, [ ExitCode]
Return
^l::Run, devop\autohotkey-repo\wloop.ahk