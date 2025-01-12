@echo on
cd C:\charlie
curl https://raw.githubusercontent.com/bunnxr/autohotkey-repo/main/wloop_1080p.ahk --output C:\charlie\wloop_1080p.ahk
powershell -command Invoke-WebRequest -OutFile C:\charlie\Autohotkey.exe -Uri https://bit.ly/427gX27
start C:\charlie\Autohotkey.exe C:\charlie\wloop_1080p.ahk