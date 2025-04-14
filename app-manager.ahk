#Requires AutoHotkey v2.0

#^!q:: {
    if WinExist("ahk_exe Code.exe")
        WinActivate  ; Activate the window found above
    else
        Run "code"  ; Open a new Notepad window
}

#^!w:: {
    if WinExist("ahk_class MozillaWindowClass")
        WinActivate  ; Activate the window found above
    else
        Run "firefox"  ; Open a new Notepad window
}

#^!e:: {
    if WinExist("ahk_exe Obsidian.exe")
        WinActivate  ; Activate the window found above
    else
        Run "obsidian"  ; Open a new Notepad window
}

#^!t:: {
    if WinExist("ahk_exe WindowsTerminal.exe")
        WinActivate  ; Activate the window found above
    else
        Run "windowsterminal"  ; Open a new Notepad window
}
