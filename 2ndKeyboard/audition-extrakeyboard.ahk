#NoEnv
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#MaxHotkeysPerInterval 99000000
#HotkeyInterval 99000000
#KeyHistory 0
ListLines Off
Process, Priority, , A
SetBatchLines, -1
SetKeyDelay, -1, -1
SetMouseDelay, -1
SetDefaultMouseSpeed, 0
SetWinDelay, -1
SetControlDelay, -1
SendMode Input
#SingleInstance force

Menu, Tray, Icon, shell32.dll, 283 ; this changes the tray icon to a little keyboard!


#IfWinActive ahk_exe Adobe Audition CC.exe 
#if (getKeyState("F23", "P"))

F23::return ;F23 is the dedicated 2nd keyboard "modifier key." You MUST allow it to "return," and cannot use it for anything else.

x::
Send ^k
sleep 30
return

m::
Send {Up}
Send +S
return