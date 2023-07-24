;bunnxr
;AutoHotkey v1.1.32.00 - November 24, 2019
;NOTES FOR SELF :- # = Win, ! = Alt, ^ = Ctrl, + = Shift , & can be used combine two keys

;#NoTrayIcon
#NoEnv  ;for performance and compatibility with future AutoHotkey releases.
;#Warn
#SingleInstance, force
#Persistent
#InstallKeybdHook
#WinActivateForce
;#Include, test.ahk
DetectHiddenWindows, On
;SetTitleMatchMode, RegEx
SetTitleMatchMode, 2
SendMode Input  ;for new scripts due to its superior speed and reliability.
SetWorkingDir D:\  ;consistent start directory. 
;Control, Hide, , Start1, ahk_class Shell_TrayWnd  ;can hide windows start button logo

{
    ;required at script startup
    Menu, Tray, NoStandard
    Menu, Tray, Add, Spy, Spy
    Menu, Tray, Add, MicID, MicID
    ;Menu, Tray, Add, syncthing, syncthing
    Menu, Tray, Add, Bearsus, bear
    Menu, Tray, Add, NirCmd, nircmdhelp
    Menu, Tray, Add, Ahk2exe, Compiler
    Menu, Tray, Add, DrvCache, drivecache
    Menu, Tray, Add, Reload, ^#r
    Menu, Tray, Add, Terminate, #Delete
    GroupAdd, CHARLie, ahk_exe VALORANT-Win64-Shipping.exe
    GroupAdd, CHARLie, ahk_exe csgo.exe
    GroupAdd, cmd, ahk_exe cmd.exe
    GroupAdd, cmd, ahk_exe powershell.exe
    GroupAdd, cmd, ahk_exe parsecd.exe
    GroupAdd, discord, ahk_exe discord.exe
    GroupAdd, discord, ahk_exe discordcanary.exe
    micid = 9
    SoundGet, micvar, , mute, %micid%
    ;Run syncthing\syncthing.bat,, hide ;syncthing in background
    ;Suspend, On
    gosub seticon ;WARNING: CONTAINS A RETURN, COMMANDS BELLOW WONT RUN
}
Return

^#/::
Suspend, Permit
;Suspend, Toggle
;Toggle := !Toggle
if A_IsSuspended
    Gosub, suspendoff
else
    Gosub, suspend
Return

suspendoff:
Suspend, Off
SoundBeep, 400
Menu, Tray, Icon
Return
suspend:
Suspend, On
SoundBeep
Menu, Tray, NoIcon
Return
syncthing:
DetectHiddenWindows, On
WinGet, syncid, PID, CHARLie_syncthing
WinShow ahk_pid %syncid%
Return
nircmdhelp:
Run, @charlie\NirCmd.chm
Return
bear:
Run, @charlie\bear.exe
Return
Compiler:
Run, @charlie\ahk2exe\Ahk2Exe.exe
Return
MicID:
Run, @charlie\MicID.exe
Return
drivecache:
Run, D:\drivecache
Return
Spy:
Run, @charlie\WindowSpy.ahk
Return

caps:
~$Capslock Up::SetCapsLockState, Off ;disabling caps and instead using it as a key
+$CapsLock Up::
SetCapsLockState % !GetKeyState("CapsLock", "T")
Return

Pause:: ;lockwindows
Suspend, Permit
DllCall("LockWorkStation")
Return

~BackSpace & Insert:: ;kill specific
InputBox, killa, killa, name of exe, ,240,123
Run, %comspec% /c taskkill /f /im %killa%.exe,,hide
Return

RAlt::SendInput #+f ;launch for browser search

AppsKey::
Send, ^!g
Return

:*?:drvid::
SendInput, https://drive.google.com/file/d/%A_Clipboard%
Return
:*?:drvapi::
SendInput, https://www.googleapis.com/drive/v3/files/%A_Clipboard%?alt=media&key=AIzaSyBW71R2u-xeBzmYazHC69gdjVHzG7NT_x0
Return

LWin & WheelDown:: ; Workspace down
SendInput {Ctrl down}{Lwin Down}{Right}{Lwin Up}{Ctrl Up}
Return
Lwin & WheelUp:: ; Workspace up
SendInput {Ctrl down}{Lwin Down}{Left}{Lwin Up}{Ctrl Up}
Return

#IfWinNotActive, ahk_group CHARLie
forgames:
`::
WinMinimize,A ;minimizes active window.
Return
F1:: ;for "My Computer"
;Run, %A_Desktop%
;Run, explorer.exe ;quick access
Run, explorer.exe /root`,`,::{20D04FE0-3AEA-1069-A2D8-08002B30309D}
Return
F2::
KeyWait, F2
IfWinNotExist, ahk_exe code.exe
run, haves\VSCode\code.exe
Return
F3::Run C:\Users\%A_UserName%\AppData ;appdata
F4::Run D:\Drive\My Drive
#IfWinNotActive
~F5 & F6:: ;suspend specific
InputBox, procu, SuspendIO, name of exe, ,240,123
Gosub, appsus
Return
~F6:: ;suspend application
procu = TekkenGame-Win64-Shipping
appsus:
Toggle := !Toggle
If Toggle
    Run, @charlie\pssuspend.exe %procu%.exe,, Hide
else
    Run, @charlie\pssuspend.exe -r %procu%.exe,, Hide
return
F7::
Toggle := !Toggle
If Toggle
    Gosub, Slowdown
else
    Gosub, Slowup
return
F12:: ;mute current windowF
nircmd:
WinGet, WinProcessName, ProcessName, A
Run, *RunAs @charlie\nircmd.exe muteappvolume %WinProcessName% 2
Return

~LAlt & `::SendInput {``} ;sending the grace accent as it was muted
 
media:
PgUp & PgDn::
PgDn & PgUp::
SendInput, {Media_Play_Pause}
Return
RShift & PgUp::SendInput, {Media_Next}
RShift & PgDn::SendInput, {Media_Prev}
~PgUp::SendInput, {Volume_Up}
~PgDn::SendInput, {Volume_Down}

;mic mute code
Home::  ; hotkey
Suspend, Permit
SoundSet, +1, MASTER, mute, %micid%
mutemic:
SoundGet, micvar, , mute, %micid%
if (micvar = "Off")
    SoundPlay, devop\sounds\micon.mp3
Else
    SoundPlay, devop\sounds\off.mp3
seticon:
if (micvar = "Off")
    Menu, Tray, Icon, devop\icons\orange.ico ;Menu, Tray, Icon, *
Else
    Menu, Tray, Icon, devop\icons\tomato.ico
Return
#if (micvar = "Off")
	~F8::
	Suspend, Permit
	SoundSet, 1, MASTER, mute, %micid%
	Return
	~F8 up::
	Suspend, Permit
	SoundSet, 0, MASTER, mute, %micid%
	Return
#if
#if (micvar = "On")
	~F8::
	Suspend, Permit
	SoundSet, 0, MASTER, mute, %micid%
	Return
		
	~F8 up::
	Suspend, Permit
	SoundSet, 1, MASTER, mute, %micid%
	Return
#if

;endscr
#Delete::
Suspend, Permit
SoundPlay, devop\sounds\terminate.mp3
Sleep 2000
ExitApp, [ ExitCode]
Return

~Capslock & home:: ;discord deafen
Send, ^+!d
Return

#IfWinActive ahk_exe code.exe
XButton1:: ;for breadcrumbs in VSCode
SendInput, ^+{.}
Return
#IfWinActive

:*?:haha::shahaha
#If GetKeyState("Joy9")
Joy2::Send {f10}
Joy1::Run D:\tekken\tekken.lnk
Joy4::Gosub, taskkill
Joy3::Gosub, nircmd
#If

#IfWinActive ahk_group cmd
~$Capslock Up::SetCapsLockState, Off
:*?:clr::
SendInput, clear;{enter}
Return

:*?:pwsh::
SendInput, powershell{enter}
pwsh:
Sleep 400
SendInput $server = "\\chrli\share\"{enter}
Sleep 200
SendRaw, function prompt {"chrli_ $pwd $ "}
Sleep 100
SendInput {enter}
SendRaw, $host.UI.RawUI.WindowTitle = "CHARLie"
Sleep 200
SendInput {enter}
Return

;selecting the file or folder to be copied
:*?:selo::
SendRaw, $host.UI.RawUI.WindowTitle = "CHARLie"
SendInput, {enter}$f=""{left}
Return
:*?:seli::
SendRaw, $host.UI.RawUI.WindowTitle = "CHARLie"
SendInput, {enter}$t=""{left}
Return

;finding the folder and then sending it
:*?:foldsend::
SendInput, $fold = get-childitem -dir -recurse{space}
SendRaw, | Where {$_.name-match $f} | Select -expand name
SendInput, {enter}robocopy $fold \\chrli\share\$fold
SendInput, {space}/MT:6 /MIR /ZB /B /J /E
SendInput, {space}/Z /TBD /V /njh /njs /ndl /nc /ns
SendInput, {space}| {`%}{`{}$data = $_.Split([char]9)
SendRaw, `; if("$($data[4])" -ne `"
Sleep 300
SendInput, {`"}{`)}{space}
SendRaw, { $ffile = "$($data[4])"}
SendInput, {space}`;Write-Progress "Completed $($data[0])"
SendInput, {space}-Activity "CHARLie"
SendInput, -CurrentOperation "$($ffile)"
SendInput, {space}{space}-ErrorAction SilentlyContinue`; {`}}{enter}
Return

;finding the file and then sending it
:*?:filesend::
SendInput, $filu = ""{Enter}
SendInput, $filu = get-childitem -recurse{space}
SendRaw, | where {$_.name-match $t} | select -expand name
SendInput, {enter}$fo = get-location | Select -expand path
SendInput, {enter}robocopy $fo \\chrli\share\ $filu /S /MT:6
SendInput, {space}/ZB /J /B /Z /TBD /V
SendInput, {space}/njh /njs /ndl /nc /ns
SendInput, {space}| {`%}{`{}$data = $_.Split([char]9)
SendRaw, `; if("$($data[4])" -ne `"
Sleep 300
SendInput, {`"}{`)}{space}
SendRaw, { $rfile = "$($data[4])"}
SendInput, {space}`;Write-Progress "Completed $($data[0])"
SendInput, {space}-Activity "CHARLie"
SendInput, -CurrentOperation "$($rfile)"
SendInput, {space}{space}-ErrorAction SilentlyContinue`; {`}}{enter}
Return

:*?:takefold:: ;takes ownership of files
SendInput, $own = get-childitem -dir -recurse{space}
SendRaw, | Where {$_.name-match $f} | Select -expand name
SendInput, {enter}takeown /f $own /r /d y{enter}
Return

:*?:takefile:: ;takes ownership of files
SendInput, $own = get-childitem -recurse{space}
SendRaw, | Where {$_.name-match $t} | Select -expand name
SendInput, {enter}takeown /f $own{enter}
Return

:*?:zr2j::zerotier-cli join 17d709436c8fbe93{Enter}
:*?:zr2l::zerotier-cli leave 17d709436c8fbe93{Enter}
:*?:zrj::zerotier-cli join 12ac4a1e718c193b{Enter}
:*?:zrl::zerotier-cli leave 12ac4a1e718c193b{Enter}
:*?:zrs::zerotier-cli status{Enter}
:*?:zrn::zerotier-cli listnetworks{Enter}
#IfWinActive

#IfWinActive ahk_group discord
dimscord:

:*?:yuro::`:yoru`:{enter}
:*?:vc::
SendRaw, <#961579220595781644>
Return
:*?:ponrv::
SendRaw, <#993475685660241972>
Return

:*?:itlic::**{left}
:*?:bld::****{left}{left}
:*?:strk::~~~~{left}{left}
:*?:`(::`(`){left}

AppsKey::Send ^g

~Capslock::
Send, ^k
Return

Tab::
Send, {Ctrl Down}{i}{Ctrl Up}
Return
#IfWinActive

#IfWinActive ahk_exe parsecd.exe
parsec:
~CapsLock & d::
Send, ^!{d}
KeyWait, CapsLock
Keywait, d, D
Winclose
Return
~CapsLock & q::
Send, ^+{i}
;SetCapsLockState, AlwaysOff
Return
~CapsLock & w::
Send, ^+{w}
;SetCapsLockState, AlwaysOff
Return
#IfWinActive
~CapsLock & Enter::
SendInput, ^{F1} ;sends accept all to parsec
Return
~CapsLock & x::
SendInput, ^{F3} ;sends kick all to parsec
Return
 
#IfWinActive ahk_exe spotify.exe
spotify:
Up::^Up
Down::^Down
Right::^Right
Left::^Left
Insert::
Run, %comspec% /c taskkill /f /im spotify.exe,,hide
Return
#IfWinActive

#IFwinActive ahk_exe explorer.exe
~Capslock::
Send, {LAlt Down}{3}{LAlt Up}{Enter}
Return
;~Capslock::
;Send, ^f
;Return
#IFwinActive

#IfWinActive killa
:*?:note::ONENOTEM{enter}
:*?:code::code{enter}
:*?:drv::GoogleDriveFS{Enter}
:*?:ds::discord{Enter}
:*?:dc::discordcanary{Enter}
:*?:edge::msedge{enter}
#IfWinActive

Insert:: ;task killer
taskkill:
Run, %comspec% /c taskkill /f /im gta_sa.exe,,hide
Run, %comspec% /c taskkill /f /im VALORANT-Win64-Shipping.exe,,hide
Run, %comspec% /c taskkill /f /im speed.exe,,hide
Run, %comspec% /c taskkill /f /im halo.exe,,hide
Run, %comspec% /c taskkill /f /im TekkenGame-Win64-Shipping.exe,,hide
Run, %comspec% /c taskkill /f /im csgo.exe,,hide
Sleep, 500
terminateapps:
SoundPlay, devop\sounds\terminateapps.mp3
Return
~alt & 3::Send {alt down}{Numpad3}{alt up}
^#r::
Suspend, Permit
Reload
Return

slowdown:
Run, *RunAs @charlie\nircmd.exe changeappvolume "msedge.exe" 1
Loop, 8
{
    Run, *RunAs @charlie\nircmd.exe changeappvolume "msedge.exe" -0.1
    Sleep, 65
}
Return
Slowup:
Loop, 8
{
    Run, *RunAs @charlie\nircmd.exe changeappvolume "msedge.exe" 0.1
    Sleep, 65
}
Return

^#E::
Run, %comspec% /c taskkill /f /im explorer.exe,,hide
Sleep, 400
Run, explorer.exe
Sleep, 6000
Run, devop\noeject.bat,,hide
Return

^l::Run, devop\autohotkey-repo\wloop.ahk
soundboard:
#IfWinExist, ahk_exe soundpad.exe
~F8 & 1::Send, ^+8 ;sneak
~F8 & 2::Send, ^+1 ;wow
~F8 & 3::Send, ^+2 ;holiday
~F8 & 4::Send, ^+4 ;gta sa
~F8 & 5::Send, ^+5 ;careless whisp
~F8 & 6::Send, ^+6 ;chamber
~F8 & 7::Send, ^+7 ;defuse
#IfWinExist