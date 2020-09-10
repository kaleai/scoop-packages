; -------------- 网易云音乐 ---------------

; 网易云音乐
#IfWinActive, ahk_class OrpheusBrowserHost
; ctrl＋Ｆ搜索
<^f::
    CoordMode, Mouse, Window
    MouseGetPos, oldX, oldY
    MouseClick, Left,440,25,1,0
    MouseMove,oldX,oldY,0
    Send,{End}
    CoordMode, Mouse, Screen
return

; 点击左下角 的歌曲图标,定位到歌曲的详情页

<^d::
    CoordMode, Mouse, Window
    MouseGetPos, oldX, oldY
    WinGetActiveStats,A , w, h, x,y
    MouseClick, Left,30,h-90,1,0
    MouseMove,oldX,oldY,0
    CoordMode, Mouse, Screen
return

<!9::
    CoordMode, Mouse, Window
    MouseGetPos, oldX, oldY
    WinGetActiveStats,A , w, h, x,y
    MouseClick, Left,208,26,1,0
    MouseMove,oldX,oldY,0
    CoordMode, Mouse, Screen
return

<!0::
    CoordMode, Mouse, Window
    MouseGetPos, oldX, oldY
    WinGetActiveStats,A , w, h, x,y
    MouseClick, Left,235,26,1,0
    MouseMove,oldX,oldY,0
    CoordMode, Mouse, Screen
return

#IfWinActive