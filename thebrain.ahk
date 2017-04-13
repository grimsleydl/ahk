#NoEnv
#InstallKeybdHook
#SingleInstance force
#MaxHotkeysPerInterval 99000000
#HotkeyInterval 99000000
ListLines Off
Process, Priority, , A
SetBatchLines, -1
SetKeyDelay, -1, -1
; SetMouseDelay, -1
; SetDefaultMouseSpeed, 0
SetWinDelay, -1
SetControlDelay, -1
SendMode Input

ENClipX := 200
ENClipY := 162

ClickFromRight(xvar, yvar, returMus:=1, negativYakse:=0) {
  MouseGetPos, musX, musY
  WinGetActiveStats, tittel, activVindubredde, activVinduHoyde, skjermposisjonX, skjermposisjonX

  actualClickPositionX := activVindubredde - xvar
  If negativYakse
  {
    actualClickPositionY := activVinduHoyde - yvar
    returKoordinatY := actualClickPositionY - musY
  }
  Else
  {
    actualClickPositionY := yvar
    returKoordinatY := musY - yvar
  }

  returDistanceX := musX - actualClickPositionX
  returDistanceY := musY - actualClickPositionY

  MouseMove, actualClickPositionX, actualClickPositionY, 0
  Send {LButton}
  If returMus
    MouseMove, returDistanceX, returDistanceY, 0, R
}

GrabURL()
{
  Send ^l
  Sleep 50
  Send {Escape}
  Sleep 50
  Send {Escape}
  Sleep 50
  Send ^l
  Sleep 50
  Send ^a
  Send ^c
  Sleep 150
  return Clipboard 
}
OneWayLink()
{
  Send ^;
  Sleep 200
  Send {Tab}
  Sleep 40
  Send {Tab}
  Sleep 40
  Send {Tab}
  Sleep 40
  Send {Space}
  Sleep 40
  Send {Tab}
  Sleep 40
  Send {Tab}
  Sleep 40
  Send {Enter}
  return
}
Archive()
{
  WinActivate, ahk_exe vivaldi.exe
  WinWaitActive, ahk_exe vivaldi.exe
  Sleep 500
  Send {Escape}
  Sleep 50
  Send {Escape}
  Sleep 50
  Send {Escape}
  Sleep 50
  Send ``
  Keywait, c, D
  Sleep 150
  Send {enter}
  Sleep 400
  ; GrabURL()
  Send ^l
  Sleep 30
  Send {Home}
  Sleep 30
  Send ar{Space}
  Sleep 100
  Send !{Enter}
  Keywait, g, D
  ; Send ^l
  ; Sleep 50
  ; Send ^c
  ; ClipWait
  ; ArchiveURL := ClipboardAll
  ; ClipWait
  ; Sleep 300
}

PasteNewThought(NewThoughtURL)
{
  global
  Clipboard := NewThoughtURL
  Sleep 150
  WinActivate, ahk_exe TheBrain.exe
  WinWaitActive, ahk_exe TheBrain.exe
  Send ^2
  Send ^+t
  Sleep 500
  Send ^{F12}
  Sleep 100
  Send {Down}
  Sleep 100
  Send {Enter}
  Sleep 100
  Send ^{F11}
}
EvernoteURLGrab()
{
  global
  WinActivate, ahk_class ENMainFrame
  WinWaitActive, ahk_class ENMainFrame
  Send +{F6}
  If throttle
  {
    Keywait, g, D
    Send {F9}
    Keywait, c, D
    Send {F3}
    Sleep 400
    Send {F2}
    Sleep 400
    Send +{Tab}
    Sleep 400
    Send {Home}
    Sleep 400
  }
  Else {
    Send {F3}
  Sleep 400
  Send {F2}
  Sleep 400
  Send +{Tab}
  Sleep 400
  }
  Send {Escape}
  Send {Escape}
  Sleep 500
  Send {AppsKey}
  Sleep 500
  Send l
  Sleep 500
  EvernoteURL := Clipboard
}

AppendToLastThought(URL)
{
  global
  Clipboard := URL
  Sleep 150
  WinActivate, ahk_exe TheBrain.exe
  WinWaitActive, ahk_exe TheBrain.exe
  ; Send ^{Home}
  ; Send ^2
  Sleep 300
  Send ^{F12}
  ; Sleep 200
  ; Send {down}
  Sleep 300
  Send ^+P
  Send ^{F11}
}

#g::
throttle := 1
MainURL := GrabURL()
Archive()
ArchiveURL := GrabURL()
Send ^]
PasteNewThought(MainURL)
EvernoteURLGrab()
AppendToLastThought(EvernoteURL)
AppendToLastThought(ArchiveURL)
return

+#g::
throttle := 0
EvernoteURLGrab()
AppendToLastThought(EvernoteURL)
return

!`;::
IfWinActive, ahk_exe TheBrain.exe
{
  OneWayLink()
}
return

; #n::
; IfWinActive, ahk_exe vivaldi.exe
; {
;   GrabURL()
; }
; return

; #y::
; ClickFromRight(%ENClipX%, %ENClipY%)