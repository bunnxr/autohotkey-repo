;bunnxr
#NoTrayIcon
#NoEnv
#SingleInstance, force
#Persistent
SendMode, Event
SetKeyDelay, 98, 80
SetWorkingDir, %A_ScriptDir%
Return

^v::
if FileExist("variable.txt")
    FileDelete, variable.txt

FileAppend, %Clipboard%, variable.txt
FileReadLine, ln1, variable.txt, 1
FileReadLine, ln2, variable.txt, 2
FileReadLine, ln3, variable.txt, 3
FileReadLine, ln4, variable.txt, 4
FileReadLine, ln5, variable.txt, 5
FileReadLine, ln6, variable.txt, 6
FileReadLine, ln7, variable.txt, 7
FileReadLine, ln8, variable.txt, 8
FileReadLine, ln9, variable.txt, 9
FileReadLine, ln10, variable.txt, 10
FileReadLine, ln11, variable.txt, 11
FileReadLine, ln12, variable.txt, 12
FileReadLine, ln13, variable.txt, 13
FileReadLine, ln14, variable.txt, 14
FileReadLine, ln15, variable.txt, 15
FileReadLine, ln16, variable.txt, 16
FileReadLine, ln17, variable.txt, 17
FileReadLine, ln18, variable.txt, 18
FileReadLine, ln19, variable.txt, 19
FileReadLine, ln20, variable.txt, 20
FileReadLine, ln21, variable.txt, 21
FileReadLine, ln22, variable.txt, 22
FileReadLine, ln23, variable.txt, 23
FileReadLine, ln24, variable.txt, 24
FileReadLine, ln25, variable.txt, 25
FileReadLine, ln26, variable.txt, 26
FileReadLine, ln27, variable.txt, 27
FileReadLine, ln28, variable.txt, 28
FileReadLine, ln29, variable.txt, 29
FileReadLine, ln30, variable.txt, 30

SendEvent {Raw}%ln1%
SendInput, `n
Sleep 100
SendEvent {Raw}%ln2%
SendInput, `n
Sleep 100
SendEvent {Raw}%ln3%
SendInput, `n
Sleep 100
SendEvent {Raw}%ln4%
SendInput, `n
Sleep 100
SendEvent {Raw}%ln5%
SendInput, `n
Sleep 100
SendEvent {Raw}%ln6%
SendInput, `n
Sleep 100
SendEvent {Raw}%ln7%
SendInput, `n
Sleep 100
SendEvent {Raw}%ln8%
SendInput, `n
Sleep 100
SendEvent {Raw}%ln9%
SendInput, `n
Sleep 100
SendEvent {Raw}%ln10%
SendInput, `n
Sleep 100
SendEvent {Raw}%ln11%
SendInput, `n
Sleep 100
SendEvent {Raw}%ln12%
SendInput, `n
Sleep 100
SendEvent {Raw}%ln13%
SendInput, `n
Sleep 100
SendEvent {Raw}%ln14%
SendInput, `n
Sleep 100
SendEvent {Raw}%ln15%
SendInput, `n
Sleep 100
SendEvent {Raw}%ln16%
SendInput, `n
Sleep 100
SendEvent {Raw}%ln17%
SendInput, `n
Sleep 100
SendEvent {Raw}%ln18%
SendInput, `n
Sleep 100
SendEvent {Raw}%ln19%
SendInput, `n
Sleep 100
SendEvent {Raw}%ln20%
SendInput, `n
Sleep 100
SendEvent {Raw}%ln21%
SendInput, `n
Sleep 100
SendEvent {Raw}%ln22%
SendInput, `n
Sleep 100
SendEvent {Raw}%ln23%
SendInput, `n
Sleep 100
SendEvent {Raw}%ln24%
SendInput, `n
Sleep 100
SendEvent {Raw}%ln25%
SendInput, `n
Sleep 100
SendEvent {Raw}%ln26%
SendInput, `n
Sleep 100
SendEvent {Raw}%ln27%
SendInput, `n
Sleep 100
SendEvent {Raw}%ln28%
SendInput, `n
Sleep 100
SendEvent {Raw}%ln29%
SendInput, `n
Sleep 100
SendEvent {Raw}%ln30%
SendInput, `n
Return

RShift::Run, %comspec% /c taskkill /f /im AutoHotkey.exe,,hide