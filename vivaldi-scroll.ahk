#NoEnv
#SingleInstance force
#MaxHotkeysPerInterval 99000000
#HotkeyInterval 99000000
ListLines Off
Process, Priority, , A
SetBatchLines, -1
SetKeyDelay, -1, -1
SetMouseDelay, -1
SetDefaultMouseSpeed, 0
SetWinDelay, -1
SetControlDelay, -1
SendMode Input

#InstallKeybdHook
#IfWinActive ahk_exe vivaldi.exe
RButton::click right
RButton & WheelDown::Send ^j
RButton & WheelUp::Send ^k
!WheelDown::Send ^j
!WheelUp::Send ^k