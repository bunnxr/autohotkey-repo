;bunnxr
;AutoHotkey v1.1.32.00 - November 24, 2019
#NoTrayIcon
#NoEnv
#SingleInstance, force
DetectHiddenWindows, On
SetTitleMatchMode, 2
SendMode Input
Sleep 200
Send, ^c
ClipWait, 2
va1 = %clipboard%
SplitPath, Clipboard, fn 
va2 := fn
FileCreateShortcut, %va1%, %A_Programs%\startup\%va2%.lnk
Sleep 600
Exitapp