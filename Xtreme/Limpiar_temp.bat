@echo off
echo Limpiando archivos temporales...
del /q /f /s "%TEMP%\*.*"
del /q /f /s "C:\Windows\Temp\*.*"
echo Temp limpiado.
exit
