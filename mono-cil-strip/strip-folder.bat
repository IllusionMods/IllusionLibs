@echo off
cd /d %~1

FOR /R %~1 %%i IN (*.dll) DO (
%~dp0\mono-cil-strip.exe %%i
)
pause