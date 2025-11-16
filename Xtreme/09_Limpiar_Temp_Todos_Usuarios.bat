@echo off
del /s /f /q C:\Windows\Temp\*
for /d %%p in (C:\Users\*) do del /s /f /q "%%p\AppData\Local\Temp\*"