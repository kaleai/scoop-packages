; https://wyagd001.github.io/zh-cn/docs/scripts/EasyWindowDrag_(KDE).htm


; 快捷键:
;  win + Left Button  : 拖动来移动窗口.
;  win + Right Button : 拖动来调整窗口大小.
;
; 您可以在首次点击 win 后操作，之后松开它也不会中断操作


; 这是在我的系统上运行的最顺畅的设置. 根据您显卡和 CPU 的速度, 您可能要增加或减小这个值.
SetWinDelay,2

CoordMode,Mouse
return

#LButton::
; 获取初始的鼠标位置和窗口 id, 并在窗口处于最大化状态时返回.
MouseGetPos,KDE_X1,KDE_Y1,KDE_id
WinGet,KDE_Win,MinMax,ahk_id %KDE_id%
If KDE_Win
    return
; 获取初始的窗口位置.
WinGetPos,KDE_WinX1,KDE_WinY1,,,ahk_id %KDE_id%
Loop
{
    GetKeyState,KDE_Button,LButton,P ; 如果按钮已经被松开了则退出.
    If KDE_Button = U
        break
    MouseGetPos,KDE_X2,KDE_Y2 ; 获取当前的鼠标位置.
    KDE_X2 -= KDE_X1 ; 得到距离原来鼠标位置的偏移.
    KDE_Y2 -= KDE_Y1
    KDE_WinX2 := (KDE_WinX1 + KDE_X2) ; 把这个偏移应用到窗口位置.
    KDE_WinY2 := (KDE_WinY1 + KDE_Y2)
    WinMove,ahk_id %KDE_id%,,%KDE_WinX2%,%KDE_WinY2% ; 移动窗口到新的位置.
}
return

#RButton::

; 获取初始的鼠标位置和窗口 id, 并在窗口处于最大化状态时返回.
MouseGetPos,KDE_X1,KDE_Y1,KDE_id
WinGet,KDE_Win,MinMax,ahk_id %KDE_id%
If KDE_Win
    return
; 获取初始的窗口位置和大小.
WinGetPos,KDE_WinX1,KDE_WinY1,KDE_WinW,KDE_WinH,ahk_id %KDE_id%

; 定义鼠标当前所处的窗口区域. 四个区为左上, 右上, 左下和右下.
If (KDE_X1 < KDE_WinX1 + KDE_WinW / 2)
   KDE_WinLeft := 1
Else
   KDE_WinLeft := -1
If (KDE_Y1 < KDE_WinY1 + KDE_WinH / 2)
   KDE_WinUp := 1
Else
   KDE_WinUp := -1
Loop
{
    GetKeyState,KDE_Button,RButton,P ; 如果按钮已经松开了则退出.
    If KDE_Button = U
        break
    MouseGetPos,KDE_X2,KDE_Y2 ; 获取当前鼠标位置.
    ; 获取当前的窗口位置和大小.
    WinGetPos,KDE_WinX1,KDE_WinY1,KDE_WinW,KDE_WinH,ahk_id %KDE_id%
    
    KDE_X2 -= KDE_X1 ; 得到距离原来鼠标位置的偏移.
    KDE_Y2 -= KDE_Y1
    ; 然后根据已定义区域进行动作.
    WinMove,ahk_id %KDE_id%,, KDE_WinX1 + (KDE_WinLeft+1)/2*KDE_X2  ; 大小调整后窗口的 X 坐标
                            , KDE_WinY1 +   (KDE_WinUp+1)/2*KDE_Y2  ; 大小调整后窗口的 Y 坐标
                            , KDE_WinW  -     KDE_WinLeft  *KDE_X2  ; 大小调整后窗口的 W (宽度)
                            , KDE_WinH  -       KDE_WinUp  *KDE_Y2  ; 大小调整后窗口的 H (高度)
    KDE_X1 := (KDE_X2 + KDE_X1) ; 为下一次的重复重新设置初始位置.
    KDE_Y1 := (KDE_Y2 + KDE_Y1)
}
return