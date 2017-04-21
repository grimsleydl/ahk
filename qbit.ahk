#NoEnv
#SingleInstance force
SetTitleMatchMode, 2
ListLines Off
Process, Priority, , A
; SetBatchLines, -1
SetKeyDelay, -1, -1
; SetMouseDelay, -1
; SetDefaultMouseSpeed, 0
; SetWinDelay, -1
SetControlDelay, -1
SendMode Input
; #MaxHotkeysPerInterval 99000000
; #HotkeyInterval 99000000
#KeyHistory 0

#IfWinActive, qBittorrent
$^P::
SendInput {AppsKey}
SendInput {Up 13}
SendInput {Right}
SendInput {Enter}
WinWaitActive Category
Sleep 25
SendInput por
Sleep 25
SendInput {Enter}
Return

$^F::
SendInput {AppsKey}
SendInput {Up 13}
SendInput {Right}
SendInput {Enter}
WinWaitActive Category
Sleep 25
SendInput por/freeleech
Sleep 25
SendInput {Enter}
Return

$^K::
SendInput {AppsKey}
SendInput {Up 13}
SendInput {Right}
SendInput {Enter}
WinWaitActive Category
Sleep 25
SendInput por/queue
Sleep 25
SendInput {Enter}
Return