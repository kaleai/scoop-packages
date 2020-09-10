;from:https://gitee.com/loki/tonyahk/blob/master/mouse.ahk#

WatchKeyboard:
MouseNeedsToBeMoved := false  ; Set default.
if(count < 2500){
    count +=10
}
SetFormat, float, 03
up:=GetKeyState("i","p")
down:=GetKeyState("k","p")
Left:=GetKeyState("j","p")
right:=GetKeyState("l","p")
RState := GetKeyState("RAlt","p")
if(!RState)
{
    return
}
if(Right)
{
    MouseNeedsToBeMoved := true
    DeltaX := 1
}
else if(Left)
{
    MouseNeedsToBeMoved := true
    DeltaX := -1
}
else
    DeltaX = 0
if (up)
{
    MouseNeedsToBeMoved := true
    DeltaY := -1
}
else if (Down)
{
    MouseNeedsToBeMoved := true
    DeltaY := 1
}
else
    DeltaY = 0
if MouseNeedsToBeMoved
{
    SetMouseDelay, -1  ; Makes movement smoother.
    MouseMove, DeltaX * sqrt(count) , DeltaY * sqrt(count), 0, R
}else{
    count = 0;
}
return


RAlt::SetTimer, WatchKeyboard,10
RAlt up::SetTimer,WatchKeyboard,Off

#if GetKeyState("RAlt","p")
*a::LButton
*r::RButton
+r::+RButton

*q::AppsKey

*u::WheelUp
*o::WheelDown
*d::WheelDown
*s::WheelLeft
*f::WheelRight

; 将鼠标移动到屏幕的中间
*m::
    WinGetActiveStats,A , w, h, x,y
    MouseGetPos, rX,rY
    MouseMove, -rX + 1/2 * w,-rY + 1/2 * h,0,r
return

; *a::Return
*b::Return
*c::Return
;*d::Return
*e::Return
;*f::Return
*g::Return
*h::Return
*i::Return
*j::Return
*k::Return
*l::Return
; *m::Return
*n::Return
;*o::Return
*p::Return
; *q::Return
; *r::Return
;*s::Return
*t::Return
;*u::Return
*v::Return
*w::Return
*x::Return
*y::Return
*z::Return

; 在多显示器移动鼠标，最多支持4个显示器
*1::
    SysGet, mc, MonitorCount
    if(mc >=1){
        SysGet, Mon, MonitorWorkArea, 1
        DllCall("SetCursorPos", "int", (MonLeft+MonRight)/2, "int", (MonTop+MonBottom)/2)
        MouseGetPos, , , id, control
        WinActivate, ahk_id  %id%
    }
Return
*2::
    SysGet, mc, MonitorCount
    if(mc >=2){
        SysGet, Mon, MonitorWorkArea, 2
        DllCall("SetCursorPos", "int", (MonLeft+MonRight)/2, "int", (MonTop+MonBottom)/2)
        MouseGetPos, , , id, control
        WinActivate, ahk_id  %id%
    }
Return
*3::
    SysGet, mc, MonitorCount
    if(mc >=3){
        SysGet, Mon, MonitorWorkArea, 3
        DllCall("SetCursorPos", "int", (MonLeft+MonRight)/2, "int", (MonTop+MonBottom)/2)
        MouseGetPos, , , id, control
        WinActivate, ahk_id  %id%
    }
Return
*4::
    SysGet, mc, MonitorCount
    if(mc >=4){
        SysGet, Mon, MonitorWorkArea, 4
        DllCall("SetCursorPos", "int", (MonLeft+MonRight)/2, "int", (MonTop+MonBottom)/2)
        MouseGetPos, , , id, control
        WinActivate, ahk_id  %id%
    }
Return

*5::Return
*6::Return
*7::Return
*8::Return
*9::Return
*0::Return
#if