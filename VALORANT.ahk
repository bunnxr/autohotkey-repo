;#NoTrayIcon
#NoEnv
#Persistent
#SingleInstance, Force
SendMode Input
DetectHiddenWindows, On
SetTitleMatchMode, 2
Menu, Tray, NoStandard
Menu, Tray, Add, How_To, howto
Menu, terminate, Add, All, allter
Menu, terminate, add, Chrome, Chrome
Menu, terminate, add, Edge, edge
Menu, terminate, add, Discord, discord
Menu, terminate, add, Parsec, parsec
Menu, Tray, add, Kill, :terminate
Menu, Tray, Add, Terminate, exit
if !A_IsAdmin
{
    Run *RunAs "%A_AhkPath%" "%A_ScriptFullPath%"
    ;add "%A_AhkPath%" if there's .ahk
    ;WARNING:remove ahkpath if script is compiled
    ExitApp
}
allvalo:
Run, %comspec% /c taskkill /f /im msedge.exe,,hide
Run, %comspec% /c taskkill /f /im chrome.exe,,hide
Run, %comspec% /c taskkill /f /im discord.exe,,hide
Run, %comspec% /c taskkill /f /im parsecd.exe,,hide
IfWinNotExist, ahk_exe D:\parsec\parsecd.exe
    Run, C:\ProgramData\Microsoft\Windows\Start Menu\Programs\Riot Games\VALORANT.lnk
Return
allter:
Run, %comspec% /c taskkill /f /im msedge.exe,,hide
Run, %comspec% /c taskkill /f /im chrome.exe,,hide
Run, %comspec% /c taskkill /f /im discord.exe,,hide
Run, %comspec% /c taskkill /f /im parsecd.exe,,hide
Return
chrome:
Run, %comspec% /c taskkill /f /im chrome.exe,,hide
Return
edge:
Run, %comspec% /c taskkill /f /im msedge.exe,,hide
Return
discord:
Run, %comspec% /c taskkill /f /im discord.exe,,hide
Return
parsec:
Run, %comspec% /c taskkill /f /im parsecd.exe,,hide
Return
F8::
Loop, {
    WinWaitActive, ahk_exe VALORANT-Win64-Shipping.exe
    SendInput {shift Down}
    SendInput {a Down}
    sleep 1100
    SendInput, {a up}
    SendInput {shift up}
    SendInput {b}
    sleep, 200
    WinWaitActive, ahk_exe VALORANT-Win64-Shipping.exe
    DllCall("SetCursorPos", "int", 495, "int", 455)
    Sleep 200
    MouseClick, Left
    WinWaitActive, ahk_exe VALORANT-Win64-Shipping.exe
    Sleep 200
    SendInput, {g}
    sleep, 300
    SendInput, {b}
    SendInput {shift Down}
    SendInput {d Down}
    sleep 1100
    SendInput, {d up}
    SendInput {shift up}
    SendInput {b}
    sleep, 300
    WinWaitActive, ahk_exe VALORANT-Win64-Shipping.exe
    DllCall("SetCursorPos", "int", 495, "int", 455)
    Sleep 200
    MouseClick, Left
    WinWaitActive, ahk_exe VALORANT-Win64-Shipping.exe
    Sleep 200
    SendInput, {g}
    sleep, 200
    SendInput, {b}
    sleep 3700
}
Return
howto:
MsgBox, 262144, Wloop(by CHARLie), v_1024`nThis script terminates necessary processes and launches VALORANT`nF8 will activate the afk script, this version starts`nand works only when VALORANT is active.`nTo close however, F9 key can be pressed `nor it can be terminated via the taskbar`nWhile VALORANT is active pressing "Insert" can terminate the game to the core.
Return
#IfWinActive ahk_exe VALORANT-Win64-Shipping.exe
:*?:tn::
SendRaw, Thanks for the Warmup
SendInput, {space}{alt down}{numpad3}{alt up}
Return
#IfWinActive
Insert::
Run, %comspec% /c taskkill /f /im VALORANT-Win64-Shipping.exe,,hide
Exitapp
F9::
exit:
ExitApp
