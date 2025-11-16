@ECHO OFF
title Memory Cleaner
mode 30,13
color 1a
:menu
cls
echo [1] Limpar memoria
echo [2] Sair
set/p menu=">"
if %menu% equ 1 goto voltar
if %menu% equ 2 exit


:voltar
set a=  °
cls
echo.
echo BAT PARA LIMPAR A MEMORIA RAM!
echo.
set n=0

echo.
:limpa
echo.
ECHO -----------Limpando-----------
ECHO.
echo.
echo.
%windir%\system32\rundll32.exe advapi32.dll,ProcessIdleTasks
msg * Memoria limpa&goto menu