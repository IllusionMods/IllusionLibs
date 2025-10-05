@echo off

rem Needed for older versions AssemblyPublicizer to find other dlls before I fixed it
cd /d %~1

rem Need to do this before stripping or it dies horribly
%~dp0\AssemblyPublicizer.exe --quiet %~1
rem Replace original files with the output
move %~1\publicized_assemblies\*.dll %~1
rmdir %~1\publicized_assemblies

FOR /R %~1 %%i IN (*.dll) DO (
%~dp0\mono-cil-strip.exe %%i
)
pause