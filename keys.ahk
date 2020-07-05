; ========================================================================
;                          ENVIRONMENT SETUP
; ========================================================================

#NoEnv  
; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  
; Enable warnings to assist with detecting common errors.

SetKeyDelay, 0, 35


;   variable          description
; ================== ============================
; %A_UserName%      | name of currently logged on user
; %A_Index%         | loop interation
; %pass{1,2,3...}%  | each line of the file var.txt. ie 
;                   | if file has 2 lines, 
;                   | first line = %pass1%
;                   | second line = %pass2%
;                   ; and so on.

; function to open specified file and assign a variable to each line

Loop
    { 
        FileReadLine, pass%A_Index%, C:/Users/%A_UserName%/var.txt, %A_Index%
    }

; ========================================================================

^#F5::
Send, {Raw}%pass1%
Send, {Enter}
return

^#F6::
Send, {Raw}%pass2%
Send, {Enter}
return

^#F7::
Send, {Raw}%pass3%
Send, {Enter}
return

^#F8::
Send, {Raw}%pass4%
Send, {Enter}
return

; ========================================================================

; ^#F9::
; Send, {Raw}%pass5%
; Send, {Enter}
; return

; ========================================================================

; ====================
; Application shortcuts
; The Run command captures the process's id and stores it as a variable, 
; and then WinWait and WinActivate are used to make sure that the launched window
; grabs window focus. Otherwise you might start typing only to find you're typing
; in another window, which can be an issue

; Win+Ins runs a shortcut to launch a WSL terminal

#Ins::
sleep, 150
Run, C:\Users\%A_UserName%\Desktop\WSL.lnk,,, process_id
;sleep, 150
WinWait, ahk_pid %process_id%
WinActivate, ahk_pid %process_id%
return

; Ctrl+Win+Ins runs a WSL2 terminal

^#Ins::
sleep,150
Run, C:\Users\%A_UserName%\Desktop\WSL2.lnk,,, process_id3
WinWait, ahk_pid %process_id3%
WinActivate, ahk_pid %process_id3%
return

; Win+Del runs a 3rd WSL terminal

#Del::
sleep, 150
Run, C:\Users\%A_UserName%\Desktop\DBN.lnk,,, process_id2
WinWait, ahk_pid %process_id2%
WinActivate, ahk_pid %process_id2%
return

; ========================================================================

; Win+O(pacity) will set the transparency of the focused window to a figure between 0-255

#o::  ; Press Win+O to turn on transparency for the window under the mouse.
WinSet, Transparent, 210, A
return

; Ctrl+Win+O turns off transprency 

^#o::  ; Press Win+O to turn off transparency for the window under the mouse.
WinSet, Transparent, Off, A
return

; Win+C(aption) removes the title bar at the top of a window. 
; This isn't very useful in windows 10, and still leaves a thin strip of visible GUI 
; on top. However, if you have a modified/custom theme, you might find using this command
; does work and leaves a title-less window.

; If running this script in Windows 7, use the second hexcode 0xc40000. 

#c::
WinSet, Style, -0x800000, A   ; windows 10 gui
;WinSet, Style, -0xc40000, A  ; windows 7 gui
return
;

;+Caption
^#c::
WinSet, Style, +0xC00000, A
return
;
