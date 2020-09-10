; ===============================================================
;
;         常用按键：alt：!；ctrl：^；shift:+；windows:#
;
; ===============================================================

Space::Send {Space}

Space & a:: send {LButton}
Space & r:: send {RButton}

Space & i:: Send {WheelUp 3}
Space & k:: Send {WheelDown 3}

Space & j::
 Send, {Shift down}{WheelUp}
 Sleep, 100
 Send, {Shift up}
 Return

Space & l::
 Send, {Shift down}{WheelDown}
 Sleep, 100
 Send, {Shift up}
 Return

Space & u:: Send {PgUp}
Space & d:: Send {pgDn}

; -----------------------------------------------------

Space & 0:: Send ^+!0
Space & 1:: Send ^+!1
Space & 2:: Send ^+!2
Space & 3:: Send ^+!3
Space & 4:: Send ^+!4

Space & 5:: Send ^+!5
Space & 6:: Send ^+!6
Space & 7:: Send ^+!7
Space & 8:: Send ^+!8
Space & 9:: Send ^+!9

; -----------------------------------------------------

; 打开控制台
Space & t:: Send {F12}

; 用文件管理器打开代码
Space & o:: Send ^+!o

; 打开structure
Space & s:: Send ^+!s

; 关闭当前活动的区块
Space & w:: Send !x

; !Space:: Send ^+!y

; 在IDE中打开log面板
space & g:: Send ^+!g

Space & c:: Send ^+!c

; -------------- 实现分屏 --------------
; 纵向分屏
Space & v:: Send ^+!v
; 横向分屏
Space & h:: Send ^+!h

; 多个窗口间进行切换
space & q:: Send ^+!q
Space & Tab:: Send ^+!z

; 切换到前一个窗口
space & b:: Send ^+!b
; 切换到后一个窗口
space & n:: Send ^+!n

; -------------- space + e: 显示or收起左侧树形目录 --------------

; 显示or收起左侧树形目录
Space & e:: Send ^!e

#IfWinActive ahk_exe chrome.exe ; for chrome

Space & e:: Send ^+d
return
#IfWinActive

; -------------- space + p: 预览信息 --------------

; 预览信息
Space & p:: Send ^+!p

#IfWinActive ahk_exe explorer.exe ; for explorer
Space & p:: Send !p
return
#IfWinActive
