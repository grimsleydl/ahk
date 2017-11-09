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
Coordmode, Mouse, Client

x := 85 ;place your desired coordinates in these two variables.
y := 145

#v::
Send {F12}
WinWaitActive, Developer Tools -
Sleep 1000
Send ^[
Sleep 500
mousegetpos, start_x, start_y
mouseclick, left, %x%, %y%, 1, 0
mousemove, %start_x%, %start_y%, 0
Send {Tab}
Send n=down
return