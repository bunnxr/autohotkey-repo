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
    Menu, Tray, Add, Reload, ^#r
    Menu, Tray, Add, Terminate, ^#Delete
    micid = 10
    appvol = spotify
    gosub seticon
}
Return




;test area

;------------------


;#Include, %A_ScriptDir%\takefile.ahk
~$Capslock Up::SetCapsLockState, Off ;disabling caps and instead using it as a key
+$CapsLock Up::SetCapsLockState % !GetKeyState("CapsLock", "T")
~LAlt & `::SendInput {``} ;sending the grace accent as it was muted
~$Capslock::SendInput #{g}

pause:: ;lockwindows
Suspend, Permit
DllCall("LockWorkStation")
Return

LWin & WheelDown::SendInput {Ctrl down}{Lwin Down}{Right}{Lwin Up}{Ctrl Up} ;workspace down
Lwin & WheelUp::SendInput {Ctrl down}{Lwin Down}{Left}{Lwin Up}{Ctrl Up} ;workspace up

com:
InputBox, comvar, com, , ,190,106 ;1650,40
if (comvar = "gpt")
    {
        InputBox, gptsr, GPT, , ,190,106 ;1650,40
        run, https://chat.openai.com/?model=gpt-4&q=%gptsr%
        Return
    }
if ErrorLevel = 1
    return
else
    run, https://www.google.com/search?q=%comvar%
Return

media_control:
~RAlt::
SendInput, {Media_Play_Pause}
Return
#IfWinExist, Spotify
;change songs easily
;replacement of pgdn/up keys
PgUp::SendInput, {Media_Next}
PgDn::SendInput, {Media_Prev}
~+PgDn::SendInput, {PgDn}
~+PgUp::SendInput, {PgUp}
#IfWinExist
RShift & PgUp::SendInput, {Media_Next}
RShift & PgDn::SendInput, {Media_Prev}
~F8 & WheelUp::SendEvent, {Volume_Up}
~F8 & WheelDown::SendEvent, {Volume_Down}

Home::  ; micmute
Suspend, Permit
SoundSet, +1, MASTER, mute, %micid%
SoundGet, micvar, , mute, %micid%
if (micvar = "Off")
	loop 2
	{
		SoundBeep, 700, 100
	}
Else
    SoundBeep, 700, 100
seticon:
SoundGet, micvar, , mute, %micid%
if (micvar = "Off")
    Menu, Tray, Icon, devop\icons\orange.ico ;Menu, Tray, Icon, *
Else
    Menu, Tray, Icon, devop\icons\tomato.ico
Return

F7::  ; slightly lower volume and increase of fixed app
Toggle := !Toggle
If Toggle
{
    Run, *RunAs @charlie\nirc.exe changeappvolume "%appvol%.exe" 1,,hide
    Loop, 9
    {
        Run, *RunAs @charlie\nirc.exe changeappvolume "%appvol%.exe" -0.1,,hide
        Sleep, 65
    }
    Return
}
else
{
    Loop, 9
        {
            Run, *RunAs @charlie\nirc.exe changeappvolume "%appvol%.exe" 0.1,,hide
            Sleep, 65
        }
    Return
}
return

F12:: ; mute current window
WinGet, WinProcessName, ProcessName, A
If (WinProcessName = "VALORANT-Win64-Shipping.exe")
    {
        WinGet, valID, PID, ahk_exe VALORANT-Win64-Shipping.exe
        WinProcessName = /%valID%
    }
Run, @charlie\nirc.exe muteappvolume %WinProcessName% 2,,hide
Return

RShift & LButton:: ; toggles always on top function on user apps
KeyWait, LButton, D
Sleep 100
WinSet, AlwaysOnTop, Toggle, A
Return

program_specifics:

#IfWinActive ahk_class #32770 ;com box shortcuts
:*?:gpt::gpt{enter}
#IfWinActive

#IfWinActive ahk_exe code.exe
XButton1::Send, ^+.
#IfWinActive

#IfWinActive ahk_exe discord.exe
:*?:yoru::`:yoru`:{enter}
:*?:vc::<{`#}961579220595781644>
:*?:v2c::<{`#}993475685660241972>
:*?:`(::`(`){left}
:*?:`<::`<`>{left}
AppsKey::Send ^g
~Capslock::Send, ^k
Tab::Send, {Ctrl Down}{i}{Ctrl Up}
#IfWinActive

valorant:

#IfWinNotActive, ahk_exe VALORANT-Win64-Shipping.exe
F13::SendInput, {F11} ;fullscreen toggle
#space::gosub com
`::WinMinimize,A ;minimizes active window.
;F7 & 1::Run, explorer.exe /root`,`,::{20D04FE0-3AEA-1069-A2D8-08002B30309D}
;\\?\Volume{0215518d-0000-0000-0000-100000000000}\
;F7 & 2::Run C:\Users\%A_UserName%\AppData ;appdata
#IfWinNotActive

#IfWinActive ahk_exe VALORANT-Win64-Shipping.exe
Pause::
Toggle := !Toggle
if Toggle
    {
        Run, devop\autohotkey-repo\wloop.ahk,,,wloopid
        SoundBeep, 400
    }
else
    {
        SoundBeep, 400
        Process, Close, %wloopid%
    }
Return

~\::
Loop,
{
    ;yuro instalock
    if (BreakLoop = 1)
        break   
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
Return
#IfWinActive

^#E:: ; restarts windows explorer and removes the eject tray icon
Run, %comspec% /c taskkill /f /im explorer.exe,,hide
Sleep, 400
Run, explorer.exe
Sleep, 6000
Run, devop\noeject.bat,,hide
Return

^#/:: ;toggle suspend on/off
Suspend, Permit
if A_IsSuspended
    {
        SoundBeep, 400
        Menu, Tray, Icon
        Suspend, Off
    }
else
    {
        SoundBeep, 400
        Menu, Tray, NoIcon
        Suspend, On
    }
Return

^#r::Reload ;reload script
^#Delete::ExitApp ;terminate script