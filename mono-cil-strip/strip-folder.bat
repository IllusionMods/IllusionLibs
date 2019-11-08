@echo off
cd %~dp0
FOR /R %~1 %%i IN (*.dll) DO mono-cil-strip %%i
pause