#SingleInstance, Force
#Persistent
#NoEnv
DetectHiddenWindows, On
SetTitleMatchMode, 2
Menu, Tray, NoStandard
Menu, Tray, Add, $CHARLie, charlie
Menu, Tray, Add, MicID, micidd
Menu, Tray, Add, changeID , change
Menu, Tray, Add, changeKEY , editkey
Menu, Tray, Add, Terminate, quit
SendMode Input
SetWorkingDir, C:\charlie\
version = v2
if FileExist("C:\charlie\%A_ScriptName%")
    Gosub, link
Else,
    run, %comspec% /c xcopy  "%A_ScriptFullPath%" "C:\charlie\" /K /D /H /Y, ,hide

link:
if FileExist("%A_Programs%\micmute.lnk")
    Gosub, ahead
Else
    FileCreateShortcut, C:\charlie\%A_ScriptName%, %A_Programs%\micmute.lnk
ahead:
FileInstall, orange.ico, C:\charlie\orange.ico
FileInstall, tomato.ico, C:\charlie\tomato.ico
FileInstall, key.txt, C:\charlie\key.txt
FileInstall, micID.txt, C:\charlie\micID.txt
FileInstall, micID.exe, C:\charlie\micID.exe
FileRead, key, C:\charlie\key.txt
hotkey, %key%, keyset
Return

;mic mute code
keyset:
FileRead, micid, C:\charlie\micID.txt
SoundSet, +1, MASTER, mute, %micid% ; numeric MicID no.
SoundGet, variab, , mute, %micid%
if (variab = "Off")
    gosub, ON
Else
    gosub, OFF
return

charlie:
GetKeyState, rg, /
if (rg = "D")
    Run C:\charlie\
Else
    MsgBox, 262144, Hellow There, This is a script created by CHARLie (@bunnxr)`nIt can be used for muting microphone plus a few quirks
Return
change:
run, C:\charlie\micID.txt
Return
quit:
Run, %comspec% /c taskkill /f /im charlie.exe,,hide
ExitApp, [ ExitCode]
micidd:
run, C:\charlie\micID.exe
Return
editkey:
run, C:\charlie\key.txt
Sleep 1000
MsgBox, 262144, Hellow there, A reload of the script is needed if the KEY is to be changed. `n`n, just save the changes THEN `nPress the "OK" button to reload the script.
WinClose, key
reload
Return

ON:
Menu, Tray, Icon, C:\charlie\orange.ico
SoundBeep, 700, 100
sleep 50
SoundBeep, 700, 100
Return
OFF:
Menu, Tray, Icon, C:\charlie\tomato.ico
SoundBeep, 700, 100
Return

#IfWinActive ahk_exe discord.exe
:*?:vc::
SendRaw, <#961579220595781644>
Return
#IfWinActive