;#NoTrayIcon
#NoEnv
#Persistent
#SingleInstance, Force
#InstallKeybdHook
SendMode Input
DetectHiddenWindows, On
SetTitleMatchMode, 2
Menu, Tray, NoStandard
Menu, Tray, Add, How_To, howto
Menu, Tray, Add, Kill Valo, kill
Menu, Tray, Add, Terminate, exit
if !A_IsAdmin
{
    Run *RunAs %A_AhkPath% "%A_ScriptFullPath%"
    ;add "%A_AhkPath%" if there's .ahk
    ;WARNING:remove ahkpath if script is compiled
    ExitApp
}
version = v2
if FileExist("C:\charlie\%A_ScriptName%")
    Gosub, link
Else,
    run, %comspec% /c xcopy  "%A_ScriptFullPath%" "C:\charlie\" /K /D /H /Y, ,hide

link:
if FileExist("%A_Programs%\$_afk.lnk")
    Gosub, val
Else
    FileCreateShortcut, C:\charlie\%A_ScriptName%, %A_Programs%\$_afk.lnk
val:
howto:
MsgBox, 262144, Wloop(by CHARLie), Is an AFK Script for VALORANT,`nthis version starts automatically when game gets active.`nTurn off 'Raw Input Buffer' in settings, for this to work.`nTo close, F9 key can be pressed `nor can be terminated via the taskbar

Gui, Add, DropDownList, x22 y42 w210  vList1 ,Red John|Daryl|Mr.Brown|Shawn Spencer|Sheldon|Andre Layton|
Gui, show
Return

OnSelect:
Gui, Submit, nohide
if (List1 = "A")
	MsgBox, Action A
else if (List1 = "B")
	MsgBox, Action B
else if (List1 = "C")
	MsgBox, Action C
; etc.
return
Loop, {
    WinWaitActive, ahk_exe VALORANT-Win64-Shipping.exe
    SendInput {shift Down}
    SendInput {a Down}
    sleep 600
    SendInput, {a up}
    SendInput {shift up}
    SendInput {b}
    sleep, 200
    WinWaitActive, ahk_exe VALORANT-Win64-Shipping.exe
    DllCall("SetCursorPos", "int", 305, "int", 338)
    DllCall("mouse_event", uint, 2, int, x, int, y, uint, 0, int, 0)
    DllCall("mouse_event", uint, 4, int, x, int, y, uint, 0, int, 0)
    Sleep 150
    DllCall("SetCursorPos", "int", 305, "int", 450)
    DllCall("mouse_event", uint, 2, int, x, int, y, uint, 0, int, 0)
    DllCall("mouse_event", uint, 4, int, x, int, y, uint, 0, int, 0)
    Sleep 150
    DllCall("SetCursorPos", "int", 305, "int", 565)
    DllCall("mouse_event", uint, 2, int, x, int, y, uint, 0, int, 0)
    DllCall("mouse_event", uint, 4, int, x, int, y, uint, 0, int, 0)
    Sleep 150
    DllCall("SetCursorPos", "int", 305, "int", 681)
    DllCall("mouse_event", uint, 2, int, x, int, y, uint, 0, int, 0)
    DllCall("mouse_event", uint, 4, int, x, int, y, uint, 0, int, 0)
    WinWaitActive, ahk_exe VALORANT-Win64-Shipping.exe
    Sleep 100
    SendInput, {b}
    sleep 50
    SendInput, {g}
    sleep 100
    SendInput, {4}
    sleep 50
    SendInput, {g}
    SendInput {shift Down}
    SendInput {d Down}
    sleep 600
    SendInput, {d up}
    SendInput {shift up}
    SendInput {b}
    sleep, 300
    WinWaitActive, ahk_exe VALORANT-Win64-Shipping.exe
    DllCall("SetCursorPos", "int", 305, "int", 338)
    DllCall("mouse_event", uint, 2, int, x, int, y, uint, 0, int, 0)
    DllCall("mouse_event", uint, 4, int, x, int, y, uint, 0, int, 0)
    Sleep 150
    DllCall("SetCursorPos", "int", 305, "int", 450)
    DllCall("mouse_event", uint, 2, int, x, int, y, uint, 0, int, 0)
    DllCall("mouse_event", uint, 4, int, x, int, y, uint, 0, int, 0)
    Sleep 150
    DllCall("SetCursorPos", "int", 305, "int", 565)
    DllCall("mouse_event", uint, 2, int, x, int, y, uint, 0, int, 0)
    DllCall("mouse_event", uint, 4, int, x, int, y, uint, 0, int, 0)
    Sleep 150
    DllCall("SetCursorPos", "int", 305, "int", 681)
    DllCall("mouse_event", uint, 2, int, x, int, y, uint, 0, int, 0)
    DllCall("mouse_event", uint, 4, int, x, int, y, uint, 0, int, 0)
    WinWaitActive, ahk_exe VALORANT-Win64-Shipping.exe
    Sleep 100
    SendInput, {b}
    sleep, 50
    SendInput, {g}
    sleep 100
    SendInput, {4}
    sleep 50
    SendInput, {g}
    sleep 3700
}
Return
kill:
Run, %comspec% /c taskkill /f /im VALORANT-Win64-Shipping.exe,,hide
Gosub, exit
$F9::
exit:
ExitApp