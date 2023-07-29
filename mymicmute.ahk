Home::  ; hotkey
SoundSet, +1, MASTER, mute, %micid%
SoundGet, micvar, , mute, %micid%
if (micvar = "Off")
    SoundPlay, devop\sounds\micon.mp3
Else
    SoundPlay, devop\sounds\off.mp3
seticon:
SoundGet, micvar, , mute, %micid%
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