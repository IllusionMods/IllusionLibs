echo off

set "folder=%~dp0"
if "%folder:~-1%"=="\" set "folder=%folder:~0,-1%"

powershell -File "%~dp0..\GenerateAllPackagesNuspec.ps1" -FolderPath "%folder%" -CompanyName "Illgames" -iconUrl "https://raw.githubusercontent.com/IllusionMods/IllusionLibs/refs/heads/master/packaging/AmanatsuLocation/icon.jpg"

pause