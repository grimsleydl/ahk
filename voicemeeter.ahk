#NoEnv
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

!Pause::
Process, Exist, VoicemeeterMacroButtons.exe
{
  if ! errorLevel {
    Run "C:\Program Files (x86)\VB\Voicemeeter\VoicemeeterMacroButtons.exe"
  }
  ; else
  ; {
  ; }
  Sleep 25
}
WinActivate, Voicemeeter.Remote
SendInput, {F23}
return