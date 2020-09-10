; ===============================================================
;
;         常用按键：alt：!；ctrl：^；shift:+；windows:#
;
; ===============================================================

^j:: Send ^+{tab}
^l:: Send ^{tab}

+Esc:: Send {~}

; ------------------------- 选择文字--------------------

+!l::Send +{right}
+!j::Send +{left}

+!h:: Send +{Home}
+!e:: Send +{End}
 
^!d::
SendInput ^d
return

; 在行中间直接换行，和大部分软件的ctrl+enter冲突了
;LCtrl & Enter::
;Send {End}{Shift Down}{Enter}{Shift Up}
;return

; ------------------ 自定义短语 -------------------

::cc::``````{enter}``````{up}

::qqe::
send 460412008@qq.com
return

::deve::
send developer-kale@foxmail.com
return

::xle::
send shark0017@sina.cn
return

::qqh::
send 460412008
return

::skp::
send shark0017
return

::sjh::
send 18516575431
return

; ---------------------- 拷貝文件路徑------------------

^+c::
send ^c
sleep,200
clipboard=%clipboard% ;%null%
tooltip,%clipboard%
sleep,500
tooltip,
return

; ---------------- 打开某磁盘 ----------------

::/c::
    run c:
return

::/e::
    run e:
return

::/d::
    run d:
return

; ------------ For XYplorer -----------

#IfWinActive ahk_class ThunderRT6FormDC 

^n:: Send ^n ; 建立文件夹
^+n:: Send ^+n ; 建立文本文件

!t:: Send {F10}

return

$Space::
    KeyWait, Space,T0.3
    If (A_TimeSincePriorHotkey > 300) ; A_TimeSincePriorHotkey,A_TimeSinceThisHotkey
        SetTimer, mainp, -1
    Else
        Send {Space}
Return

mainp:
    Send !{F1} ; 文件预览
Return

#IfWinActive

; ------------- For Chrome -----------

#IfWinActive ahk_class Chrome_WidgetWin_0

!d::send ^d ; 定位到地址栏

return
#IfWinActive

; ------------- For Cmder -----------

#IfWinActive ahk_class VirtualConsoleClass

^!s::send #!p ; 定位到地址栏

return
#IfWinActive