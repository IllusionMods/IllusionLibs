echo off

set "folder=%~dp0"
if "%folder:~-1%"=="\" set "folder=%folder:~0,-1%"

powershell -File "%~dp0..\GenerateAllPackagesNuspec.ps1" -FolderPath "%folder%" -CompanyName "Illgames"

pause