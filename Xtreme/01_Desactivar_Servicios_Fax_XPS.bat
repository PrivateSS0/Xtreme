@echo off
dism /online /disable-feature /featurename:Printing-XPSServices-Features /norestart
dism /online /disable-feature /featurename:FaxServicesClientPackage /norestart