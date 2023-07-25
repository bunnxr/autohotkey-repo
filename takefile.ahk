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