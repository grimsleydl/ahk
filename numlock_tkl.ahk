#NoEnv
#SingleInstance force
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

; Ctrl+F12 toggles NumLock, if NumLock on then 0-9 = Numpad0-Numpad9
^F12::SetNumLockState, % (GetKeyState("NumLock","t")) ? "Off" : "On"

#if, GetKeyState("NumLock", "T")
0::Numpad0
1::Numpad1
2::Numpad2
3::Numpad3
4::Numpad4
5::Numpad5
6::Numpad6
7::Numpad7
8::Numpad8
9::Numpad9

#if