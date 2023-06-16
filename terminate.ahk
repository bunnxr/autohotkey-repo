#SingleInstance, Force
SendMode Input
SetWorkingDir, %A_ScriptDir%
Insert::
Run, %comspec% /c taskkill /f /im gta_sa.exe,,hide
Run, %comspec% /c taskkill /f /im VALORANT.exe,,hide
Run, %comspec% /c taskkill /f /im VALORANT-Win64-Shipping.exe,,hide
Run, %comspec% /c taskkill /f /im speed.exe,,hide
Run, %comspec% /c taskkill /f /im halo.exe,,hide
Return