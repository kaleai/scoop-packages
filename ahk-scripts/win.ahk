; ===============================================================
;
;         常用按键：alt：!；ctrl：^；shift:+；windows:#
;
; ===============================================================

#s:: send #^+!s ; 截屏

;#e:: send #4

#e::
IfWinNotExist, ahk_class Clover_WidgetWin_0
  run, explorer.exe
IfWinActive
  WinMinimize
else
  WinActivate
return


#n:: send ^+n ;打开xx

; ------------ XXXXXX -----------

;#b::Run, % "rundll32.exe user32.dll,LockWorkStation"
;#n:: send #l

/*#t::
Send !.
Sleep 300
Send {Shift}
Send t{Space}
Sleep 50
Send {Shift}
return
*/

; ------------------ 打开快捷方式所在的文件夹 ---------------------


;-------------- 快速选中并搜索（Find）----------------

#f::
Send ^c   ;输入 ctrl+c
;sleep,100  ; 等待100毫秒
clipwait

;根据选中的内容打开百度搜索
run https://www.baidu.com/s?ie=utf-8&f=8&rsv_bp=1&rsv_idx=1&tn=92765401_hao_pg&wd=%clipboard%
return

;-------------- 操作窗口 ----------------

#w:: send !{F4} ; 关闭当前窗口

#m::
WinMinimize, A ;最小化当前窗口
return

;#Left::Send, #^+!s
;#Right::Send, #^+!s

; 移动窗口到另一个显示屏
#^j:: send #+{left}
#^l:: send #+{right}

#^q:: send #+{right}

;------------- 操作虚拟桌面 --------------

LWin & Enter Up::
Send ^#d ; 新建桌面
Return

LWin & BackSpace Up::
Send ^#{F4} ; 删除当前桌面
Return

; 切换桌面
#9:: Send #^{Left}
#0:: Send #^{Right}

#WheelUp::
 SendInput ^#{Right}
 sleep ,200
 return

#WheelDown::
 SendInput ^#{Left}
 sleep ,200
 return

#WheelRight::
 SendInput ^#{Right}
 sleep ,200
 return

 #WheelLeft::
 SendInput ^#{Left}
 sleep ,200
 return

 ;----------------------- 操作音樂 ----------------------

Lwin & , Up::
Send {Media_Prev}
Return

Lwin & . Up::
Send {Media_Next}
Return

Lwin & ' Up::
Send {Media_Play_Pause}
Return

;------------ Normal/Max Window -----------

RShift:: 
WinGet, Status_minmax ,MinMax,a ;;A表示当前激活的
If Status_minmax=1
{
	;MsgBox 当前最大化
	WinRestore ,A ;a表示当前激活的
}
else
{
	WinMaximize ,a
}
return

;------------ For Double Esc -----------

~Esc::
Keywait, Escape, , t0.2
if (errorlevel = 1){
    return
}
else{
    Keywait, Escape, d, t0.1
    if errorlevel = 0
    {
        WinGetActiveTitle, Title
        WinClose, %Title%
        return
    }
}
return