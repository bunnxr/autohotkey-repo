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
Menu, Tray, Add, Terminate, quit
SendMode Input
SetWorkingDir, %A_ScriptDir%
FileCreateDir, %A_temp%\@bunnxr
FileInstall, mute.ico, %A_temp%\@bunnxr\mute.ico
FileInstall, unmute.ico, %A_temp%\@bunnxr\unmute.ico
FileInstall, micID.exe, %A_temp%\@bunnxr\micID.exe
FileInstall, key.txt, %A_temp%\@bunnxr\key.txt
FileInstall, micID.txt, %A_temp%\@bunnxr\micID.txt
FileInstall, spy.exe, %A_temp%\@bunnxr\spy.exe
FileInstall, afk.exe, %A_temp%\@bunnxr\afk.exe
FileInstall, on.mp3, %A_temp%\@bunnxr\on.mp3
FileInstall, off.mp3, %A_temp%\@bunnxr\off.mp3
FileInstall, micID.exe, %A_temp%\@bunnxr\micID.exe
FileRead, key, %A_temp%\@bunnxr\key.txt
hotkey, %key%, keyset
Return
;mic mute code
keyset:
FileRead, micid, %A_temp%\@bunnxr\micID.txt
SoundSet, +1, MASTER, mute, %micid% ; numeric MicID no.
SoundGet, variab, , mute, %micid%
if (variab = "Off")
    gosub, on
Else
    gosub, off
return

charlie:
MsgBox, 262144, Hellow There, This is a script created by CHARLie (@bunnxr)`nIt can be used for muting microphone plus a few quirks
Return
change:
run, %A_temp%\@bunnxr\micID.txt
Return
quit:
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
SoundPlay, %A_temp%\@bunnxr\on.mp3
Return
OFF:
Menu, Tray, Icon, %A_temp%\@bunnxr\mute.ico
SoundPlay, %A_temp%\@bunnxr\off.mp3
Return

#IfWinActive ahk_exe discord.exe
:*?:vc::
SendRaw, <#961579220595781644>
Return
#IfWinActive