;bunnxr
;AutoHotkey v1.1.32.00 - November 24, 2019
;NOTES FOR SELF :- # = Win, ! = Alt, ^ = Ctrl, + = Shift , & can be used combine two keys

;#NoTrayIcon
#NoEnv  ;for performance and compatibility with future AutoHotkey releases.
;#Warn
#SingleInstance, force
#Persistent
#InstallKeybdHook
#WinActivateForce
;#Include, test.ahk
DetectHiddenWindows, On
;SetTitleMatchMode, RegEx
SetTitleMatchMode, 2
SendMode Input  ;for new scripts due to its superior speed and reliability.
SetWorkingDir D:\  ;consistent start directory. 
;Control, Hide, , Start1, ahk_class Shell_TrayWnd  ;can hide windows start button logo

{
    ;required at script startup
    Menu, Tray, NoStandard
    Menu, Tray, Add, Spy, Spy
    Menu, Tray, Add, MicID, MicID
    ;Menu, Tray, Add, syncthing, syncthing
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
    SoundGet, micvar, , mute, %micid%
    ;Run syncthing\syncthing.bat,, hide ;syncthing in background
    ;Suspend, On
    gosub seticon ;WARNING: CONTAINS A RETURN, COMMANDS BELLOW WONT RUN
}
Return

suspendoff:
Suspend, Off
SoundBeep, 400
Menu, Tray, Icon
Return
suspend:
Suspend, On
SoundBeep
Menu, Tray, NoIcon
Return
Compiler:
Run, @charlie\ahk2exe\Ahk2Exe.exe
Return
MicID:
Run, @charlie\MicID.exe
Return
drivecache:
Run, D:\drivecache
Return
Spy:
Run, @charlie\WindowSpy.ahk
Return

caps:
~$Capslock Up::SetCapsLockState, Off ;disabling caps and instead using it as a key
+$CapsLock Up::
SetCapsLockState % !GetKeyState("CapsLock", "T")
Return

Pause:: ;lockwindows
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

AppsKey:: ;drive search
Send, ^!g
Return

LWin & WheelDown:: ; Workspace down
SendInput {Ctrl down}{Lwin Down}{Right}{Lwin Up}{Ctrl Up}
Return
Lwin & WheelUp:: ; Workspace up
SendInput {Ctrl down}{Lwin Down}{Left}{Lwin Up}{Ctrl Up}
Return

#IfWinNotActive, ahk_group CHARLie
`::WinMinimize,A ;minimizes active window.
F1::Run, explorer.exe /root`,`,::{20D04FE0-3AEA-1069-A2D8-08002B30309D}
;F2::
;KeyWait, F2
;IfWinNotExist, ahk_exe code.exe
;run, haves\VSCode\code.exe

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
~PgUp::SendInput, {Volume_Up}
~PgDn::SendInput, {Volume_Down}

#Include, %A_scriptdir%\mymicmute.ahk

~Capslock & home:: ;discord deafen
Send, ^+!d
Return

#IfWinActive ahk_exe code.exe
XButton1:: ;for breadcrumbs in VSCode
SendInput, ^+{.}
Return
#IfWinActive

;:*?:haha::shahaha
;#If GetKeyState("Joy9")
;Joy2::Send {f10}
;Joy1::Run D:\tekken\tekken.lnk
;Joy4::Gosub, taskkill
;Joy3::Gosub, nircmd
;#If

#Include, %A_ScriptDir%\takefile.ahk

#IfWinActive ahk_group discord
dimscord:

:*?:yuro::`:yoru`:{enter}
:*?:vc::
SendRaw, <#961579220595781644>
Return
:*?:ponrv::
SendRaw, <#993475685660241972>
Return

:*?:itlic::**{left}
:*?:bld::****{left}{left}
:*?:strk::~~~~{left}{left}
:*?:`(::`(`){left}

AppsKey::Send ^g

~Capslock::
Send, ^k
Return

Tab::
Send, {Ctrl Down}{i}{Ctrl Up}
Return
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
;SetCapsLockState, AlwaysOff
Return
~CapsLock & w::
Send, ^+{w}
;SetCapsLockState, AlwaysOff
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
;~Capslock::
;Send, ^f
;Return
#IFwinActive

#IfWinActive killa
:*?:note::ONENOTEM{enter}
:*?:code::code{enter}
:*?:drv::GoogleDriveFS{Enter}
:*?:ds::discord{Enter}
:*?:dc::discordcanary{Enter}
:*?:edge::msedge{enter}
#IfWinActive

;Insert:: ;task killer
taskkill:
Run, %comspec% /c taskkill /f /im gta_sa.exe,,hide
Run, %comspec% /c taskkill /f /im VALORANT-Win64-Shipping.exe,,hide
Run, %comspec% /c taskkill /f /im speed.exe,,hide
Run, %comspec% /c taskkill /f /im halo.exe,,hide
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