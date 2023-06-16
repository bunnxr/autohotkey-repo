;bunnxr
;AutoHotkey v1.1.32.00 - November 24, 2019

;bellow are some custom scripts if you don't get it, then don't change it, lol

;NOTES FOR SELF :- # = Win, ! = Alt, ^ = Ctrl, + = Shift 
;whereas "&" has been used as an ampersand between any two keys or mouse buttons to combine them into a custom hotkey.
;some keys are marked as a comment, in order to either archive them or disable temporarily

;#NoTrayIcon ;<-- this can be used in order to have no icon on taskbar
#NoEnv  ; for performance and compatibility with future AutoHotkey releases.
;#Warn  ; Enable warnings to assist with detecting common errors.
#Persistent ;makes the script persistent
SendMode Input  ; for new scripts due to its superior speed and reliability.
SetWorkingDir D:\  ; consistent start directory. 
;Menu, Tray, Add, Process, process
Menu, Tray, Add, CHARLie, dir

dir() {
    Run, %A_ScriptDir%
    return
}

process() {
    Run, "needed\process_\nightly_build\ProcessHacker.exe"  ; Process Hacker
    return
}

`::
WinMinimize,A ;minimizes active window.
return

Lwin & WheelDown:: ; Workspace down
Send {Ctrl down}{Lwin Down}{Right}{Lwin Up}{Ctrl Up}
Return

Lwin & WheelUp:: ; Workspace up
Send {Ctrl down}{Lwin Down}{Left}{Lwin Up}{Ctrl Up}
Return

F1:: ;for "My Computer" lol
Run, explorer.exe /root`,`,::{20D04FE0-3AEA-1069-A2D8-08002B30309D} 
Return

F2:: 
run, %process%, ; Process Hacker
return

F3:: 
Run, "C:\Users\%A_UserName%\AppData"  ;appdata of any user the script is running
return

{   ;The space Spectrum (Programs)
    
    {   ; MEDIA CONTROLS
        Shift & Space::
        Send {Media_Play_Pause}
        Return
        ~Space & d::
        F8 & WheelUp::
        Send {Media_Next}
        Return
        ~Space & a::
        F8 & WheelDown::
        Send {Media_Prev}
        Return 
        ~Space & w::
        ~Space & WheelUp::
        Send {Volume_Up}
        ;Send {CtrlDown}}{F12}
        Return
        ~Space & s::
        ~Space & WheelDown::
        Send {Volume_Down}
        ;Send {CtrlDown}}{F11}
        Return
    }

    {   ;function key hotkeys  
        ;main key is "`"
        ~Space & F1:: ;vol for multi apps
        Run "C:\Windows\System32\SndVol.exe"
        Return
    }    
    
    ~Space & q:: ;clipboard shortcut
    Send, #v 
    return
    ~Space & e:: ;emoji shortcut
    Send #. 
    return
}

; -------------------------------------------------------------------------------
^#!p::Pause
Return
^#!q::
MsgBox, Script will be Terminated - CHARLie
ExitApp, [ ExitCode]
Return
PgDn::
Suspend, Toggle
return
^#!r::Reload
;----------------------------------