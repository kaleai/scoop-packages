; ===============================================================
;
;         常用按键：alt：!；ctrl：^；shift:+；windows:#
;
; ===============================================================

!9:: Send !{left}
!0:: Send !{right}

!BS:: Send {Delete}
>!':: Send {Ins}

;------------------------ 全局搜索 ---------------------------

!,:: send ^+q ; 火柴搜索
; !.:: send +^. ; listary搜索

;------------------------ F1~F8、F11 -------------------------

!1:: Send {F1}
!2:: Send {F2}
!3:: Send {F3}
!4:: Send {F4}
!5:: Send {F5}
!6:: Send {F6}
!7:: Send {F7}
!8:: Send {F8}
!-:: Send {F11}

;------------------------ 光标移动 -------------------------

!j:: Send {left}
!l:: Send {right}
!i:: Send {up}
!k:: Send {down}

!e:: Send {End}
!h:: send {Home}

;!u::
;SendInput, ^{Up 6}
;Return

;!o::
;SendInput, ^{Down 6}
;Return

;------------ For Double LAlt -----------

~LAlt::
if (A_PriorHotkey <> "~LAlt" or A_TimeSincePriorHotkey > 400)
{
    KeyWait, LAlt
    return
}

if GetKeyState("Capslock", "T"){
    SetCapsLockState,off
}
else{
    SetCapsLockState,on
}
return

;------------ 在alt + tab 调出任务视图时用edsf代替方向键 -----------

#IfWinActive, ahk_class MultitaskingViewFrame
<!e::SendInput ,{AltDown}{Up}
<!d::SendInput ,{AltDown}{Down}
<!s::SendInput ,{AltDown}{Left}
<!f::SendInput ,{AltDown}{Right}
#IfWinActive

;------------ 在钉钉中使用 alt+s 执行 Enter -----------

#IfWinActive, ahk_class StandardFrame_DingTalk
<!s::SendInput ,{Enter}
#IfWinActive