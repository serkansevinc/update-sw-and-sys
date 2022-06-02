New-Item -ItemType Directory -Force -Path '.\' | Out-Null
Invoke-WebRequest -Uri "https://github.com/lord-carlos/nvidia-update/raw/master/nvidia.ps1" -OutFile ".\nvidia.ps1" -UseBasicParsing
SchTasks /Create /SC DAILY /TN "Nvidia-Updater" /TR "powershell -NoProfile -ExecutionPolicy Bypass -File .\nvidia.ps1" /ST 10:00

Install-Module -Name PSWindowsUpdate
Save-Module -Name PSWindowsUpdate -Path '.\'
