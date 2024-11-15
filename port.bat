echo off
title port@charlie
xcopy "@charlie\CdmResource" "C:\port@charlie\CdmResource\" /K /D /H /Y /s /e
xcopy "@charlie\nt++" "C:\port@charlie\nt++\" /K /D /H /Y /s /e
xcopy "@charlie\rar" "C:\port@charlie\rar\" /K /D /H /Y /s /e
xcopy "@charlie\registry" "C:\port@charlie\registry\" /K /D /H /Y /s /e
xcopy "@charlie\Aga.Controls.dll" "C:\port@charlie\" /K /D /H /Y
xcopy "@charlie\ahk.exe" "C:\port@charlie\" /K /D /H /Y
xcopy "@charlie\base.bat" "C:\port@charlie\" /K /D /H /Y
xcopy "@charlie\cdm.exe" "C:\port@charlie\" /K /D /H /Y
xcopy "@charlie\cdm.ini" "C:\port@charlie\" /K /D /H /Y
xcopy "@charlie\charl.bat" "C:\port@charlie\" /K /D /H /Y
xcopy "@charlie\clrupdatecache.bat" "C:\port@charlie\" /K /D /H /Y
xcopy "@charlie\cpuz.exe" "C:\port@charlie\" /K /D /H /Y
xcopy "@charlie\cpuz.ini" "C:\port@charlie\" /K /D /H /Y
xcopy "@charlie\cyberdriver.mp3" "C:\port@charlie\" /K /D /H /Y
xcopy "@charlie\desktop.ini" "C:\port@charlie\" /K /D /H /Y
xcopy "@charlie\gpuz.exe" "C:\port@charlie\" /K /D /H /Y
xcopy "@charlie\hevc.Appx" "C:\port@charlie\" /K /D /H /Y
xcopy "@charlie\holypandas.jpg" "C:\port@charlie\" /K /D /H /Y
xcopy "@charlie\size.exe" "C:\port@charlie\" /K /D /H /Y
xcopy "@charlie\installer.bat" "C:\port@charlie\" /K /D /H /Y
xcopy "@charlie\micID.exe" "C:\port@charlie\" /K /D /H /Y
xcopy "@charlie\monitor.config" "C:\port@charlie\" /K /D /H /Y
xcopy "@charlie\monitor.exe" "C:\port@charlie\" /K /D /H /Y
xcopy "@charlie\network.cfg" "C:\port@charlie\" /K /D /H /Y
xcopy "@charlie\network.exe" "C:\port@charlie\" /K /D /H /Y
xcopy "@charlie\nirc.exe" "C:\port@charlie\" /K /D /H /Y
xcopy "@charlie\OpenHardwareMonitorLib.dll" "C:\port@charlie\" /K /D /H /Y
xcopy "@charlie\OxyPlot.dll" "C:\port@charlie\" /K /D /H /Y
xcopy "@charlie\OxyPlot.WindowsForms.dll" "C:\port@charlie\" /K /D /H /Y
xcopy "@charlie\path.bat" "C:\port@charlie\" /K /D /H /Y
xcopy "@charlie\script_base.ahk" "C:\port@charlie\" /K /D /H /Y
xcopy "@charlie\script_charlie.ahk" "C:\port@charlie\" /K /D /H /Y
xcopy "@charlie\shortu.ico" "C:\port@charlie\" /K /D /H /Y
xcopy "@charlie\spy.exe" "C:\port@charlie\" /K /D /H /Y
xcopy "@charlie\sudo.bat" "C:\port@charlie\" /K /D /H /Y
xcopy "@charlie\SymlinkCreator.exe" "C:\port@charlie\" /K /D /H /Y
xcopy "C:\port@charlie\base.bat" "%APPDATA%\Microsoft\Windows\Start Menu\Programs\Startup\donottouch.bat" /K /D /H /Y
attrib +s +h "C:\port@charlie"
setx path "%PATH%;C:\port@charlie" /M
echo CHARLie Was here, transfer complete
timeout 3
quit