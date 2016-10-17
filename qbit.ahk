#SingleInstance force
SetTitleMatchMode, 2
#IfWinActive, qBittorrent
^F::
SendInput {AppsKey}
SendInput {Up 13}
SendInput {Right}
SendInput {Enter}
WinWaitActive Category
SendInput por/freeleech
SendInput {Enter}

^P::
SendInput {AppsKey}
SendInput {Up 13}
SendInput {Right}
SendInput {Enter}
WinWaitActive Category
SendInput por
SendInput {Enter}