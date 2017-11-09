#NoEnv
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
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
SetTitleMatchMode, 3 ;The window title must match EXACTLY

~f2::
Loop ;Do repeatedly forever
{
  WinWait, Rename ahk_class #32770 ;Wait until the rename popup is found
  ControlSend, , y ;Send alt+y to say 'Yes'
  break
}
; Send {esc}
return