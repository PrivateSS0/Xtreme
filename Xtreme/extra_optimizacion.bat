@echo off
echo Limpiando caché DNS...
ipconfig /flushdns
echo Limpiando Prefetch...
del /q /f /s C:\Windows\Prefetch\*.*
echo Optimizando servicios...
sc stop DiagTrack
sc stop WSearch
echo Optimización completa.
exit
