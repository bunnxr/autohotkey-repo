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
    Run *RunAs "%A_AhkPath%" "%A_ScriptFullPath%"
    ExitApp
}
version = v2
if FileExist("C:\charlie\%A_ScriptName%")
Gosub, link
Else,
run, %comspec% /c xcopy "%A_ScriptFullPath%" "C:\charlie\" /K /D /H /Y, ,hide
link:
if FileExist("%A_Programs%\$_afk.lnk")
    Gosub, val
Else
    FileCreateShortcut, C:\charlie\autohotkey.exe, %A_Programs%\$_afk.lnk, C:\charlie, C:\charlie\wloop_1080p.ahk,,,l
val:
howto:
MsgBox, 262144, Wloop(by CHARLie), Is an AFK Script for VALORANT,`nthis version starts automatically when game gets active.`nTurn off 'Raw Input Buffer' in settings, for this to work.`nTo close, F9 key can be pressed `nor can be terminated via the taskbar
Sleep 1500
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
DllCall("SetCursorPos", "int", 276, "int", 421)
DllCall("mouse_event", uint, 2, int, x, int, y, uint, 0, int, 0)
DllCall("mouse_event", uint, 4, int, x, int, y, uint, 0, int, 0)
Sleep 150
DllCall("SetCursorPos", "int", 276, "int", 571)
DllCall("mouse_event", uint, 2, int, x, int, y, uint, 0, int, 0)
DllCall("mouse_event", uint, 4, int, x, int, y, uint, 0, int, 0)
Sleep 150
DllCall("SetCursorPos", "int", 276, "int", 721)
DllCall("mouse_event", uint, 2, int, x, int, y, uint, 0, int, 0)
DllCall("mouse_event", uint, 4, int, x, int, y, uint, 0, int, 0)
Sleep 150
DllCall("SetCursorPos", "int", 276, "int", 871)
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
DllCall("SetCursorPos", "int", 276, "int", 421)
DllCall("mouse_event", uint, 2, int, x, int, y, uint, 0, int, 0)
DllCall("mouse_event", uint, 4, int, x, int, y, uint, 0, int, 0)
Sleep 150
DllCall("SetCursorPos", "int", 276, "int", 571)
DllCall("mouse_event", uint, 2, int, x, int, y, uint, 0, int, 0)
DllCall("mouse_event", uint, 4, int, x, int, y, uint, 0, int, 0)
Sleep 150
DllCall("SetCursorPos", "int", 276, "int", 721)
DllCall("mouse_event", uint, 2, int, x, int, y, uint, 0, int, 0)
DllCall("mouse_event", uint, 4, int, x, int, y, uint, 0, int, 0)
Sleep 150
DllCall("SetCursorPos", "int", 276, "int", 871)
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