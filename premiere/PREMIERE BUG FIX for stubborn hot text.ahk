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

;ORIGINAL BUG REPORT THREAD ON ADOBE FORUMS, WITH DanielOvrutskiy's SOLUTION: https://forums.adobe.com/message/6258808#6258808

;DanielOvrutskiy's code is below, was taken from here: https://pastebin.com/aUPjqnkL

;I do not yet know if this code might interfere with other left-click functions in Premiere. I'll keep running the script on my own machine to test for any possible problems.

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; PREMIERE START
; Numeric control drag hack/fix for Premiere using AutoHotKey. Works by manipulating windows pointer speed (SPI_SETMOUSESPEED) during dragging with Left Mouse Button. Resets to default 6 ticks when not.
Menu, Tray, Icon, shell32.dll, 100 ;changes the icon to a little clicking hand

#IfWinExist ahk_exe Adobe Premiere Pro.exe

~LButton::
If WinActive("ahk_exe Adobe Premiere Pro.exe"){
  MouseGetPos, x,y
if (x > 300 and x < 800 and y > 115 and y < 860)
  DllCall("SystemParametersInfo", UInt, 0x71, UInt, 0, UInt, 11, UInt, 0) ; Slightly Faster then Windows default
} 
Return

~LButton Up::
DllCall("SystemParametersInfo", UInt, 0x70, UInt, 0, UInt, MOUSE_NOW, UInt, 0)
If MOUSE_NOW != 10 ; Check if the speed is not default, adjust this as needed.
  DllCall("SystemParametersInfo", UInt, 0x71, UInt, 0, UInt, 10, UInt, 0) ; Default Windows 6 Ticks [10], adjust this as needed.
Return

#IfWinExist

; PREMIERE END
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;