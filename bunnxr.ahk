;bunnxr
;AutoHotkey v1.1.32.00 - November 24, 2019
;# = Win, ! = Alt, ^ = Ctrl, + = Shift , & can be used combine two keys
;#NoTrayIcon
#NoEnv
#SingleInstance, force
#Persistent
#InstallKeybdHook
DetectHiddenWindows, On
SetTitleMatchMode, 2
SendMode Input
SetWorkingDir D:\ 
;Control, Hide, , Start1, ahk_class Shell_TrayWnd  ;can hide windows start button logo

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
    micid = 9
    gosub seticon
}
Return

#Include, %A_scriptdir%\ahkmenu.txt
#Include, %A_scriptdir%\mymicmute.ahk
#Include, %A_ScriptDir%\takefile.ahk

caps:
~$Capslock Up::SetCapsLockState, Off ;disabling caps and instead using it as a key
+$CapsLock Up::SetCapsLockState % !GetKeyState("CapsLock", "T")

$Pause:: ;lockwindows
Suspend, Permit
DllCall("LockWorkStation")
Return

~Backspace & 1::InputBox, kill1, killa, name of exe, ,240,123
~Backspace & 2::InputBox, kill2, killa, name of exe, ,240,123
~BackSpace & Insert::
InputBox, kill3, killa, name of exe, ,240,123
Gosub Kill
Return

Insert::
KeyWait, Insert, U
KeyWait, BackSpace, D T3
If ErrorLevel
    Return
Else
    Run, %comspec% /c taskkill /f /im %kill1%.exe,,hide
    Run, %comspec% /c taskkill /f /im %kill2%.exe,,hide
    Kill:
    Run, %comspec% /c taskkill /f /im %kill3%.exe,,hide
Return

AppsKey::Send, ^!g ;drive search

LWin & WheelDown::SendInput {Ctrl down}{Lwin Down}{Right}{Lwin Up}{Ctrl Up} ;workspace down
Lwin & WheelUp::SendInput {Ctrl down}{Lwin Down}{Left}{Lwin Up}{Ctrl Up} ;workspace up

#IfWinNotActive, ahk_group CHARLie
`::WinMinimize,A ;minimizes active window.
F1::Run, explorer.exe /root`,`,::{20D04FE0-3AEA-1069-A2D8-08002B30309D}
F3::Run C:\Users\%A_UserName%\AppData ;appdata
F4::Run D:\Drive\My Drive
#IfWinNotActive
~F5 & F6:: ;suspend specific
InputBox, procu, SuspendIO, name of exe, ,240,123
Gosub, appsus
Return
~F6:: ;suspend application
procu = discord
appsus:
Toggle := !Toggle
If Toggle
    Run *RunAs @charlie\pssuspend.exe %procu%.exe,, Hide
else
    Run *RunAs @charlie\pssuspend.exe -r %procu%.exe,, Hide
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
    WinGet, valID, PID, ahk_exe VALORANT-Win64-Shipping.exe
    WinProcessName = /%valID%
Run, *RunAs @charlie\nircmd.exe muteappvolume %WinProcessName% 2
Return

~LAlt & `::SendInput {``} ;sending the grace accent as it was muted
 
MEDIAKEYS:
PgUp & PgDn::
PgDn & PgUp::
SendInput, {Media_Play_Pause}
Return
RShift & PgUp::SendInput, {Media_Next}
RShift & PgDn::SendInput, {Media_Prev}
~PgUp::SendEvent, {Volume_Up}
~PgDn::SendEvent, {Volume_Down}

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
:*?:ponrv::<{`#}993475685660241972>
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
 
#IfWinActive ahk_exe spotify.exe
Up::^Up
Down::^Down
Right::^Right
Left::^Left
#IfWinActive

#IFwinActive ahk_exe explorer.exe
~Capslock::
Send, {LAlt Down}{3}{LAlt Up}{Enter}
Return
#IFwinActive

#IfWinActive killa
:*?:note::ONENOTEM{enter}
:*?:code::code{enter}
:*?:drv::GoogleDriveFS{Enter}
:*?:ds::discord{Enter}
:*?:dc::discordcanary{Enter}
:*?:edge::msedge{enter}
:*?:valo::VALORANT-Win64-Shipping.exe{enter}
#IfWinActive

;Insert:: ;task killer
taskkill:
Run, %comspec% /c taskkill /f /im VALORANT-Win64-Shipping.exe,,hide
Run, %comspec% /c taskkill /f /im TekkenGame-Win64-Shipping.exe,,hide
Run, %comspec% /c taskkill /f /im csgo.exe,,hide
Sleep, 500
Return
~alt & 3::Send {alt down}{Numpad3}{alt up} ;valorant heart

slowdown:
Run, *RunAs @charlie\nircmd.exe changeappvolume "msedge.exe" 1
Loop, 8
{
    Run, *RunAs @charlie\nircmd.exe changeappvolume "msedge.exe" -0.1
    Sleep, 65
}
Return
Slowup:
Loop, 8
{
    Run, *RunAs @charlie\nircmd.exe changeappvolume "msedge.exe" 0.1
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
^l::Run, devop\autohotkey-repo\wloop.ahk