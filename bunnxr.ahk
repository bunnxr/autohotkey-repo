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
;Control, Hide, , Start1, ahk_class Shell_TrayWnd
;can hide windows start button logo
;Control, Hide, , TrayShowDesktopButtonWClass1, ahk_class Shell_TrayWnd
;hides the show desktop button taskbar

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
    micid = 10
    appvol := spotify
    procu = Discord
    gosub seticon
}
Return

#Include, %A_scriptdir%\shortu.ahk
#Include, %A_scriptdir%\mymicmute.ahk
;#Include, %A_ScriptDir%\takefile.ahk

caps:
~$Capslock Up::SetCapsLockState, Off ;disabling caps and instead using it as a key
+$CapsLock Up::SetCapsLockState % !GetKeyState("CapsLock", "T")

!4::Send, !{F4} ;alt+f4
F8 & -::Send, {F11} ;fullscreen

;+BackSpace:: ;lockwindows
Suspend, Permit
DllCall("LockWorkStation")
Return

LWin & WheelDown::SendInput {Ctrl down}{Lwin Down}{Right}{Lwin Up}{Ctrl Up} ;workspace down
Lwin & WheelUp::SendInput {Ctrl down}{Lwin Down}{Left}{Lwin Up}{Ctrl Up} ;workspace up

#IfWinNotActive, ahk_group CHARLie
;`::WinMinimize,A ;minimizes active window.
;F7 & 1::Run, explorer.exe /root`,`,::{20D04FE0-3AEA-1069-A2D8-08002B30309D}
;\\?\Volume{0215518d-0000-0000-0000-100000000000}\
;F7 & 2::Run C:\Users\%A_UserName%\AppData ;appdata
Rctrl & LShift::Run D:\on

#space::gosub com
#IfWinNotActive

com:
InputBox, kill3, com, , ,190,106 ;1650,40
if (kill3 = "gpt")
    run, https://chatgpt.com/?temporary-chat=true
if (kill3 = "wait")
    InputBox, kill3, com, , ,190,106
if (kill3 = "short")
    gosub shortu
else
    ;run, https://www.google.com/search?q=%kill3%
    Run, %comspec% /c taskkill /f /im %kill3%.exe,,hide
Return
F7 & 7::
Toggle := !Toggle
If Toggle
    Gosub, Slowdown
else
    Gosub, Slowup
return
=:: ;mute current windowF
;WinGet, WinProcessName, ProcessName, A
;If (WinProcessName = "VALORANT-Win64-Shipping.exe")
{
    ;WinGet, valID, PID, ahk_exe VALORANT-Win64-Shipping.exe
    ;WinProcessName = /%valID%
}
;%WinProcessName%
Run, *RunAs @charlie\nirc.exe muteappvolume parsecd.exe 2,,hide
Return
F9::

~LAlt & `::SendInput {``} ;sending the grace accent as it was muted
 
MEDIAKEYS:
~RAlt::
SendInput, {Media_Play_Pause}
Return
RShift & PgUp::SendInput, {Media_Next}
RShift & PgDn::SendInput, {Media_Prev}
~F8 & WheelUp::SendEvent, {Volume_Up}
~F8 & WheelDown::SendEvent, {Volume_Down}


#IfWinActive ahk_group discord
dimscord:
:*?:yoru::`:yoru`:{enter}
:*?:vc::<{`#}961579220595781644>
:*?:v2c::<{`#}993475685660241972>
:*?:itlic::**{left}
:*?:bld::****{left}{left}
:*?:strk::~~~~{left}{left}
:*?:`(::`(`){left}
:*?:`<::`<`>{left}
AppsKey::Send ^g
~Capslock::Send, ^k
Tab::Send, {Ctrl Down}{i}{Ctrl Up}
#IfWinActive

AppsKey & y::
Loop,
{
    ;yuro instalock
    WinWaitActive, ahk_exe VALORANT-Win64-Shipping.exe
    ;wait for valorant to be active
    Sleep 20
    DllCall("SetCursorPos", "int", 383, "int", 733)
    ;set cursor position to 383 and 733 co-ordinates
    Sleep 100 ;necessary for the cursor to move
    DllCall("mouse_event", uint, 2, int, x, int, y, uint, 0, int, 0)
    ;mouse button down
    DllCall("mouse_event", uint, 4, int, x, int, y, uint, 0, int, 0)
    ;mouse button up
    Sleep 50
    DllCall("SetCursorPos", "int", 953, "int", 747)
    Sleep 100
    DllCall("mouse_event", uint, 2, int, x, int, y, uint, 0, int, 0)
    DllCall("mouse_event", uint, 4, int, x, int, y, uint, 0, int, 0)
}

#IfWinActive ahk_class #32770
/*
:*?:riot::RiotClientServices.exe{enter}
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
:*?:stop::stop{enter}
*/
#IfWinActive

slowdown:
Run, *RunAs @charlie\nirc.exe changeappvolume "msedge.exe" 1,,hide
Loop, 9
{
    Run, *RunAs @charlie\nirc.exe changeappvolume "msedge.exe" -0.1,,hide
    Sleep, 65
}
Return
Slowup:
Loop, 9
{
    Run, *RunAs @charlie\nirc.exe changeappvolume "msedge.exe" 0.1,,hide
    Sleep, 65
}
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
^l::Run, devop\autohotkey-repo\wloop_1080p.ahk