Home::  ; hotkey
SoundSet, +1, MASTER, mute, %micid%
SoundGet, micvar, , mute, %micid%
if (micvar = "Off")
	loop 2
	{
		SoundBeep, 700, 100
	}
Else
    SoundBeep, 700, 100
seticon:
SoundGet, micvar, , mute, %micid%
if (micvar = "Off")
    Menu, Tray, Icon, devop\icons\orange.ico ;Menu, Tray, Icon, *
Else
    Menu, Tray, Icon, devop\icons\tomato.ico
Return
/*
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
*/