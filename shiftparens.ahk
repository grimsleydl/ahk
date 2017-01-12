#NoEnv
#SingleInstance force
ListLines Off
Process, Priority, , A
SetBatchLines, -1
SetKeyDelay, -1, -1
SetMouseDelay, -1
SetDefaultMouseSpeed, 0
SetWinDelay, -1
SetControlDelay, -1
SendMode Input

~*LShift::
if !State {
  State := (GetKeyState("Alt", "P") || GetKeyState("Shift", "P") || GetKeyState("LWin", "P") || GetKeyState("RWin", "P"))
; For some reason, this code block gets called repeatedly when LShift is kept pressed.
; Hence, we need a guard around StartTime to ensure that it doesn't keep getting reset.
; Upon startup, StartTime does not exist thus this if-condition is also satisfied when StartTime doesn't exist.
if (StartTime = "") {
  StartTime := A_TickCount
}
}
return

$~LShift Up::
elapsedTime := A_TickCount - StartTime
if (  !State
  && (A_PriorKey = "LShift")
&& (elapsedTime <= 300)) {
  Send {(}
}
State     := 0
; We can reset StartTime to 0. However, setting it to an empty string allows it to be used right after first run
StartTime := ""
return


~*RShift::
if !State {
  State := (GetKeyState("Alt", "P") || GetKeyState("Shift", "P") || GetKeyState("LWin", "P") || GetKeyState("RWin", "P"))
; For some reason, this code block gets called repeatedly when RShift is kept pressed.
; Hence, we need a guard around StartTime to ensure that it doesn't keep getting reset.
; Upon startup, StartTime does not exist thus this if-condition is also satisfied when StartTime doesn't exist.
if (StartTime = "") {
  StartTime := A_TickCount
}
}
return

$~RShift Up::
elapsedTime := A_TickCount - StartTime
if (  !State
  && (A_PriorKey = "RShift")
&& (elapsedTime <= 400)) {
  Send {)}
  }
  State     := 0
  ; We can reset StartTime to 0. However, setting it to an empty string allows it to be used right after first run
  StartTime := ""
return

; $~*LShift::
;    ;msgbox, %A_ThisHotkey% is down
;    ;// when you hold down the key, this hotkey fires constnatly due to the normal OS-level repeat
;    ;// so we only want to store the time from the initial downpress, not each OS-repeat)
;    ;// and then during the 'up' hotkey, we reset this timestamp back to 0
;    if (!LShift_down_timestamp)      
;       LShift_down_timestamp := A_TickCount
   
;    ;// if any other modifiers are down along with this key, then we will not send the replacement key (left parens)
;    if (!LShift_modifiers_are_pressed)
;       LShift_modifiers_are_pressed := (GetKeyState("Control", "P") ||  GetKeyState("Alt", "P") || GetKeyState("LWin", "P") || GetKeyState("RWin", "P"))
; return

; $~LShift up::
;    ;msgbox, %A_PriorKey%
;    ;msgbox, %A_ThisHotkey%
;    ;// check if EITHER shift key was the last key pressed
;    ;// this allows accidental 'rolling': presing Lshift then Rshift very fast, where you hadn't fully released the LShift before RShift went down
;    ;// also, you must press and release LShift within 300ms, otherwise this doesn't trigger. 
;    ;// i found myself sometimes holding LShift for a while, planning on capitalizing a letter
;    ;// but then releasing the key, causing this hotkey to trigger erroneously
;    if (A_PriorKey ~= "LShift|RShift") && (!LShift_modifiers_are_pressed) && (A_TickCount - LShift_down_timestamp < 300)
;       Send, {Shift Down}9{Shift Up}         ;// send left parenthesis
;    LShift_modifiers_are_pressed := false
;    LShift_down_timestamp := 0
; return

; ; LShift + RShift
; <+RShift:: MsgBox, LShift + RShift

; ; RShift + LShift
; >+LShift:: MsgBox, RShift + LShift

; ;	2xLShift

; ~LShift::
; If (A_PriorHotKey = "~LShift Up" AND A_TimeSincePriorHotkey < 300)
;   MsgBox, 2xLShift
; return

; ~LShift Up:: Send, ^c{Shift Up} ;	copy

; ;	2xRShift

; ~RShift::
; If (A_PriorHotKey = "~RShift Up" AND A_TimeSincePriorHotkey < 300)
;   MsgBox, 2xRShift
; return

; ~RShift Up:: Send,{Shift Up}