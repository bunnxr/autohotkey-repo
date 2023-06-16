#Persistent
SendMode Input
;mic mute code
F21::  ; hotkey
SoundSet, +1, MASTER, mute, 8 ; numeric MicID no.
SoundGet, variab, , mute, 8
if (variab = "Off")
    SoundBeep, 400, 80
Else
    SoundBeep, 1100, 50
    sleep 50
    SoundBeep, 1100, 50
return