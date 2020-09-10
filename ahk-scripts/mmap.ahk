; ===============================================================
;
;         常用按键：alt：!；ctrl：^；shift:+；windows:#
;
; ===============================================================

#SingleInstance, force
if not A_IsAdmin ;running by administrator
{
   Run *RunAs "%A_ScriptFullPath%"
   ExitApp
}
#MaxHotkeysPerInterval 500
#NoEnv
;  #WinActivateForce
Process Priority,,High


#include alt.ahk
#Include cloud.ahk
; #Include drag.ahk
; #Include mouse.ahk
#Include normal.ahk
#Include space.ahk
#Include win.ahk
