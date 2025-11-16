@echo off
wmic computersystem where name="%computername%" set AutomaticManagedPagefile=False
wmic pagefileset where name="C:\\pagefile.sys" set InitialSize=1024,MaximumSize=1024
shutdown -r -t 10