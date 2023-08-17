#IfWinActive ahk_group cmd
~$Capslock Up::SetCapsLockState, Off
:*?:clr::
SendInput, clear;{enter}
Return

:*?:pwsh::
SendInput, powershell{enter}
pwsh:
Sleep 400
SendInput $server = "\\deploychrli\share\"{enter}
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
sleep 100
SendRaw, | Where {$_.name-match $f} | Select -expand name
sleep 100
SendInput, {enter}robocopy $fold \\deploychrli\share\$fold
sleep 100
gosub foldprog
Return

;finding the folder and then getting it
:*?:foldget::
SendInput, $fo = get-location | Select -expand path{enter}
sleep 100
SendInput, cd $server{enter}
sleep 100
SendInput, $fold = get-childitem -dir -recurse{space}
sleep 100
SendRaw, | Where {$_.name-match $f} | Select -expand name
sleep 100
SendInput, {enter}cd $fo{enter}
sleep 100
SendInput, robocopy $server\$fold $fold
sleep 100
gosub foldprog
Return

foldprog:
SendInput, {space}/MT:6 /MIR /ZB /B /J /E
sleep 100
SendInput, {space}/Z /TBD /V /njh /njs /ndl /nc /ns
sleep 100
SendInput, {space}| {`%}{`{}$data = $_.Split([char]9)
SendRaw, `; if("$($data[4])" -ne `"
Sleep 300
SendInput, {`"}{`)}{space}
SendRaw, { $ffile = "$($data[4])"}
sleep 100
SendInput, {space}`;Write-Progress "Completed $($data[0])"
sleep 100
SendInput, {space}-Activity "CHARLie"
sleep 100
SendInput, -CurrentOperation "$($ffile)"
SendInput, {space}{space}-ErrorAction SilentlyContinue`; {`}}{enter}
Return

;finding the file and then sending it
:*?:filesend::
SendInput, $filu = get-childitem -recurse{space}
sleep 100
SendRaw, | where {$_.name-match $t} | select -expand name
sleep 100
SendInput, {enter}$fo = get-location | Select -expand path
sleep 100
SendInput, {enter}robocopy $fo \\deploychrli\share\ $filu /S /MT:6
gosub fileprog
Return

;finding the file and then getting it
:*?:fileget::
SendInput, $fo = get-location | Select -expand path{enter}
sleep 100
SendInput, cd $server{enter}
sleep 100
SendInput, $filu = get-childitem -recurse{space}
sleep 100
SendRaw, | where {$_.name-match $t} | select -expand name
SendInput, {enter}cd $fo{enter}
sleep 100
SendInput, robocopy $server $fo $filu /S /MT:6
sleep 100
gosub fileprog
Return

fileprog:
SendInput, {space}/ZB /J /B /Z /TBD /V
sleep 100
SendInput, {space}/njh /njs /ndl /nc /ns
sleep 100
SendInput, {space}| {`%}{`{}$data = $_.Split([char]9)
sleep 100
SendRaw, `; if("$($data[4])" -ne `"
Sleep 300
SendInput, {`"}{`)}{space}
sleep 100
SendRaw, { $rfile = "$($data[4])"}
sleep 100
SendInput, {space}`;Write-Progress "Completed $($data[0])"
sleep 100
SendInput, {space}-Activity "CHARLie"
sleep 100
SendInput, -CurrentOperation "$($rfile)"
sleep 100
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