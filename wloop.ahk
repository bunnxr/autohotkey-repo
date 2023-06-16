#NoTrayIcon
#SingleInstance, Force
SendMode Input
MsgBox, , Wloop(by CHARLie), How to Use `n Press F8 to run `n Press F9 to quit `n relaunch if you wanna use again

F8::
Loop, {
    SendInput {w Down}
    sleep 600
    SendInput, {w up}
    SendInput {b}
    sleep, 100
    MouseClick
    sleep, 100
    SendInput, {f}
    Sleep 200
    SendInput, {b}
    SendInput {s Down}
    sleep 600
    SendInput, {s up}
    SendInput {b}
    sleep, 100
    MouseClick
    sleep, 100
    SendInput, {f}
    Sleep 200
    SendInput, {b}
    sleep 3000
}
Return
F9::ExitApp