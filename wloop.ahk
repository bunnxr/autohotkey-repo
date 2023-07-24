;#NoTrayIcon
#NoEnv
#Persistent
#SingleInstance, Force
SendMode Input
DetectHiddenWindows, On
SetTitleMatchMode, 2
Menu, Tray, NoStandard
Menu, Tray, Add, How_To, howto
Menu, Tray, Add, Terminate, exit
if !A_IsAdmin
{
    Run *RunAs "%A_AhkPath%" "%A_ScriptFullPath%"
    ;add "%A_AhkPath%" if there's .ahk
    ;WARNING:remove ahkpath if script is compiled
    ExitApp
}

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
    sleep, 90
    MouseClick, Left
    Sleep 50
    DllCall("SetCursorPos", "int", 305, "int", 450)
    sleep, 90
    MouseClick, Left
    Sleep 50
    DllCall("SetCursorPos", "int", 305, "int", 565)
    sleep, 90
    MouseClick, Left
    Sleep 50
    DllCall("SetCursorPos", "int", 305, "int", 681)
    sleep, 90
    MouseClick, Left
    WinWaitActive, ahk_exe VALORANT-Win64-Shipping.exe
    Sleep 100
    SendInput, {b}
    sleep, 50
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
    sleep, 90
    MouseClick, Left
    Sleep 50
    DllCall("SetCursorPos", "int", 305, "int", 450)
    sleep, 90
    MouseClick, Left
    Sleep 50
    DllCall("SetCursorPos", "int", 305, "int", 565)
    sleep, 90
    MouseClick, Left
    Sleep 50
    DllCall("SetCursorPos", "int", 305, "int", 681)
    sleep, 90
    MouseClick, Left
    WinWaitActive, ahk_exe VALORANT-Win64-Shipping.exe
    Sleep 100
    SendInput, {b}
    sleep, 50
    SendInput, {g}
    sleep 3700
}
Return
howto:
MsgBox, 262144, Wloop(by CHARLie), This version starts automatically when VALORANT gets active.`nTo close however, F9 key can be pressed `nor can be terminated via the taskbar
F9::
exit:
ExitApp