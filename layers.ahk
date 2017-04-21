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
#installkeybdhook
; SetNumLockState,On
; SetNumLockState,AlwaysOn

; SetScrollLockState,Off
; SetScrollLockState,AlwaysOff

; *;::
;   ; Send {`; down}
;   semicolon_held := 1
; while (semicolon_held){
;   j::Down
;   h::Left
;   k::Up
;   l::Right
;   u::^z
;   [::Send {End}
;   ]::Send {PgDn}
;   =::Send {PgUp}
;   Space::Send {Return}
;   0::Send {PgUp}
;   1::6
;   2::7
;   3::8
;   4::9
;   5::
; }
; return
; *$`; up::
; if (semicolon_held := 1){
;   if (semicolon_send){
;   send {`;}
;   }
;   semicolon_held := 0
; }
; return
;
; last_ctrl_down_time := 0
; ctrl_used := false
; ctrl_down := false

; *CapsLock::
;   if (ctrl_down) {
;     return
;   }
;   Send {Ctrl Down}
;   last_ctrl_down_time := A_TickCount
;   ctrl_used := false
;   ctrl_down := true
;   return

; *CapsLock Up::
;   Send {Ctrl Up}
;   ctrl_down := false
;   if (ctrl_used) {
;       return
;   }
;   time_elapsed := A_TickCount - last_ctrl_down_time
;   if (time_elapsed <= 250) {
;     Send {Blind}{Esc}
;   }
;   return

last_semicolon_down_time := 0
semicolon_used := false
semicolon_down := false

*;::
  if (semicolon_down) {
    return
  }
  
  semicolon_used := false
  semicolon_down := true
  last_semicolon_down_time := A_TickCount
  return

*; Up::
  semicolon_down := false
  if (semicolon_used) {
    return
  }
  time_elapsed := A_TickCount - last_semicolon_down_time
  if (time_elapsed <= 250) {
    Send {Blind}{;}
  }
  return

; ~*a::
~*b::
~*c::
; ~*d::
; ~*e::
~*f::
~*g::
~*i::
~*m::
; ~*n::
~*o::
; ~*p::
~*q::
~*r::
~*s::
~*t::
; ~*u::
~*v::
~*w::
~*x::
~*y::
~*z::
~*1::
~*2::
~*3::
~*4::
~*5::
~*6::
~*7::
~*8::
~*9::
~*0::
~*Space::
~*Backspace::
~*Delete::
~*Insert::
~*Home::
~*End::
~*PgUp::
~*PgDn::
~*Tab::
~*Return::
~*,::
~*.::
~*/::
~*'::
~*[::
~*]::
~*\::
~*-::
~*=::
~*`::
~*F1::
~*F2::
~*F3::
~*F4::
~*F5::
~*F6::
~*F7::
~*F8::
~*F9::
~*F10::
~*F11::
~*F12::
  
  return

*j::
 
  if (semicolon_down) {
    Send {Blind}{Down}
    semicolon_used := true
  } else {
    Send {Blind}j
  }
  return

*k::

  if (semicolon_down) {
    Send {Blind}{Up}
    semicolon_used := true
  } else {
    Send {Blind}k
  }
  return

*l::
  
  if (semicolon_down) {
    Send {Blind}{Right}
    semicolon_used := true
  } else {
    Send {Blind}l
  }
  return

*h::
 
  if (semicolon_down) {
    Send {Blind}{Left}
    semicolon_used := true
  } else {
    Send {Blind}h
  }
  return

*n::

  if (semicolon_down) {
    Send {Blind}{PgDn}
    semicolon_used := true
  } else {
    Send {Blind}n
  }
  return

*p::

  if (semicolon_down) {
    Send {Blind}{PgUp}
  semicolon_used := true
  } else {
    Send {Blind}p
  }
  return

*e::

if (semicolon_down) {
    Send {Blind}{End}
    semicolon_used := true
  } else {
    Send {Blind}e
  }
  return

*a::

  if (semicolon_down) {
    Send {Blind}{Home}
    semicolon_used := true
  } else {
    Send {Blind}a
  }
  return

*u::

  if (semicolon_down) {
    Send {Blind} ^z
    semicolon_used := true
  } else {
    Send {Blind}u
  }
  return

*d::
  if (semicolon_down) {
    Send {Blind}{Delete}
    semicolon_used := true
  } else {
    Send {Blind}d
  }
  return