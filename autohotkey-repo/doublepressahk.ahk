{  ;Double press charm:-
     ;empty key (for not in use) add a key to make it work
    if winc_presses > 0  
    {
        winc_presses += 1
        Return
    }   
    
    winc_presses = 1
    SetTimer, TheKey, 220  ;change 220 to a lower number to decrease the amount of time it waits to receive "" twice in a row
    Return

    TheKey:
    SetTimer, TheKey, off

    if winc_presses = 1  
        {
            ;send,         ; remove the ";" before the send command to make this work
        }

    Else if winc_presses = 2 
        {
            ;send,        ; remove the ";" before the send command to make this work
        }   

    winc_presses = 0
    Return
}
