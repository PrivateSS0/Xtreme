Set objShell = CreateObject("Shell.Application")
objShell.ShellExecute "cmd.exe", "/c EmptyStandbyList.exe workingsets", "", "runas", 0