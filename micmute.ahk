#SingleInstance, Force
#Persistent
#NoEnv
DetectHiddenWindows, On
SetTitleMatchMode, 2
Menu, Tray, NoStandard
Menu, Tray, Add, $CHARLie, charlie
Menu, Tray, Add, WindowSpy, Spy
Menu, Tray, Add, MicID, micidd
Menu, Tray, Add, AFK script, afk
Menu, Tray, Add, changeID , change
Menu, Tray, Add, changeKEY , editkey
Menu, Tray, Add, PTTmode, ptt
Menu, Tray, Add, Terminate, quit
SendMode Input
SetWorkingDir, %A_ScriptDir%
FileCreateDir, %A_temp%\@bunnxr
FileInstall, charlie.exe, %A_temp%\@bunnxr\charlie.exe
FileInstall, plate.txt, %A_temp%\@bunnxr\plate.txt
FileInstall, mute.ico, %A_temp%\@bunnxr\mute.ico
FileInstall, unmute.ico, %A_temp%\@bunnxr\unmute.ico
FileInstall, ptt.ico, %A_temp%\@bunnxr\ptt.ico
FileInstall, micID.exe, %A_temp%\@bunnxr\micID.exe
FileInstall, key.txt, %A_temp%\@bunnxr\key.txt
FileInstall, micID.txt, %A_temp%\@bunnxr\micID.txt
FileInstall, spy.exe, %A_temp%\@bunnxr\spy.exe
FileInstall, afk.exe, %A_temp%\@bunnxr\afk.exe
FileInstall, ptt.mp3, %A_temp%\@bunnxr\ptt.mp3
FileInstall, micID.exe, %A_temp%\@bunnxr\micID.exe
FileRead, key, %A_temp%\@bunnxr\key.txt
Run, %comspec% /c attrib +h +s %A_temp%\@bunnxr,,hide
Run, %comspec% /c attrib +h +s %A_temp%\@bunnxr\charlie.exe,,hide
hotkey, %key%, keyset
FileReadLine, includescr, %A_temp%\@bunnxr\plate.txt, 1
if (includescr = ";1")
    gosub incld
Return

;mic mute code
keyset:
FileRead, micid, %A_temp%\@bunnxr\micID.txt
SoundSet, +1, MASTER, mute, %micid% ; numeric MicID no.
SoundGet, variab, , mute, %micid%
if (variab = "Off")
    gosub, ON
Else
    gosub, OFF
return

ptt:
Tog := !Tog
If Tog
    gosub ptton
else
    reload
return
ptton:
Menu, Tray, Icon, %A_temp%\@bunnxr\ptt.ico
FileRead, micid, %A_temp%\@bunnxr\micID.txt
hotkey, %key%, down
keyup = %key% up
hotkey, %keyup%, up
SoundPlay, %A_temp%\@bunnxr\ptt.mp3
down:
Suspend, Permit
SoundSet, 1, MASTER, mute, %micid%
Return
up:
Suspend, Permit
SoundSet, 0, MASTER, mute, %micid%
Return

incld:
if FileExist("%A_temp%\@bunnxr\temp.ahk")
    FileDelete, %A_temp%\@bunnxr\temp.ahk
FileRead, data, %A_temp%\@bunnxr\plate.txt
Sleep 600
FileAppend, %data%, %A_temp%\@bunnxr\temp.ahk
Run, %A_temp%\@bunnxr\charlie.exe %A_temp%\@bunnxr\temp.ahk
Return
charlie:
GetKeyState, rg, /
if (rg = "D")
    Run %A_temp%\@bunnxr\plate.txt
Else
    MsgBox, 262144, Hellow There, This is a script created by CHARLie (@bunnxr)`nIt can be used for muting microphone plus a few quirks
Return
change:
run, %A_temp%\@bunnxr\micID.txt
Return
quit:
Run, %comspec% /c taskkill /f /im charlie.exe,,hide
ExitApp, [ ExitCode]
spy:
run, %A_temp%\@bunnxr\spy.exe
Return
afk:
run, %A_temp%\@bunnxr\afk.exe
Return
micidd:
run, %A_temp%\@bunnxr\micID.exe
Return
editkey:
run, %A_temp%\@bunnxr\key.txt
Sleep 1000
MsgBox, 262144, Hellow there, A reload of the script is needed if the KEY is to be changed. `n`nNo Worries, just save the changes THEN `nPress the "OK" button to reload the script.
WinClose, key
reload
Return

ON:
Menu, Tray, Icon, %A_temp%\@bunnxr\unmute.ico
SoundBeep, 400, 80
Return
OFF:
Menu, Tray, Icon, %A_temp%\@bunnxr\mute.ico
SoundBeep, 1100, 50
sleep 50
SoundBeep, 1100, 50
Return

#IfWinActive ahk_exe discord.exe
:*?:vc::
SendRaw, <#961579220595781644>
Return
#IfWinActive