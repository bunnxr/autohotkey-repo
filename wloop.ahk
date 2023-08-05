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
Menu, Tray, Add, Terminate, exit
if !A_IsAdmin
{
    Run *RunAs "%A_ScriptFullPath%"
    ;add "%A_AhkPath%" if there's .ahk
    ExitApp
}

Loop, {
    WinWaitActive, ahk_exe VALORANT-Win64-Shipping.exe
    SendInput {shift Down}
    SendInput {a Down}
    WinWaitActive, ahk_exe VALORANT-Win64-Shipping.exe
    sleep 600
    SendInput, {a up}
    WinWaitActive, ahk_exe VALORANT-Win64-Shipping.exe
    SendInput {shift up}
    SendInput {b}
    sleep, 200
    WinWaitActive, ahk_exe VALORANT-Win64-Shipping.exe
    DllCall("SetCursorPos", "int", 488, "int", 464)
    Sleep 100
    DllCall("mouse_event", uint, 2, int, x, int, y, uint, 0, int, 0)
    Sleep 100
    DllCall("mouse_event", uint, 4, int, x, int, y, uint, 0, int, 0)
    WinWaitActive, ahk_exe VALORANT-Win64-Shipping.exe
    Sleep 100
    SendInput, {b}
    WinWaitActive, ahk_exe VALORANT-Win64-Shipping.exe
    sleep 50
    SendInput, {g}
    WinWaitActive, ahk_exe VALORANT-Win64-Shipping.exe
    SendInput {shift Down}
    SendInput {d Down}
    WinWaitActive, ahk_exe VALORANT-Win64-Shipping.exe
    sleep 600
    SendInput, {d up}
    SendInput {shift up}
    WinWaitActive, ahk_exe VALORANT-Win64-Shipping.exe
    SendInput {b}
    sleep, 300
    WinWaitActive, ahk_exe VALORANT-Win64-Shipping.exe
    DllCall("SetCursorPos", "int", 488, "int", 464)
    Sleep 100
    DllCall("mouse_event", uint, 2, int, x, int, y, uint, 0, int, 0)
    Sleep 100
    DllCall("mouse_event", uint, 4, int, x, int, y, uint, 0, int, 0)
    WinWaitActive, ahk_exe VALORANT-Win64-Shipping.exe
    Sleep 100
    SendInput, {b}
    WinWaitActive, ahk_exe VALORANT-Win64-Shipping.exe
    sleep, 50
    SendInput, {g}
    sleep 3700
}
Return
howto:
MsgBox, 262144, Wloop(by CHARLie), This version starts automatically when VALORANT gets active.`nTo close however, F9 key can be pressed `nor can be terminated via the taskbar
$F9::
exit:
ExitApp