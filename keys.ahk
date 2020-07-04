; ========================================================================
;                          ENVIRONMENT SETUP
; ========================================================================

#NoEnv  
; Recommended for performance and compatibility with future AutoHotkey releases.
#Warn  
; Enable warnings to assist with detecting common errors.
; SendMode Input  
; Recommended for new scripts due to its superior speed and reliability.

; SetWorkingDir %A_ScriptDir%  
; Ensures a consistent starting directory.

; WIP workaround to gain focus of newly-created WSL session
; change if you have issues with getting window focus
;#WinActivateForce
;SetWinDelay, 150
SetKeyDelay, 0, 35

; adding this to sent output this should make pressing a hotkey run smoothly
; {vkE8}


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

; fileread, contents,  C:/Users/%A_UserName%/var.txt	;reads the notepad
; loop, parse, contents, `n	;read notepad line by line
; {
; 		pass%a_index% = %a_loopfield%	;assign var
; }

; swagfag method
;##################################################################
; MsgBox % readLineNum(3, FileOpen("C:\mylongasstxtfile.txt", "r"))
;
; readLineNum(lineNum, fileObj) {
;	Loop % lineNum
;	{
;		line := ""
;		readLine := fileObj.ReadLine()
;
;		Loop 
;		{
;			line .= readLine
;###################################################################

; ========================================================================

^#F5::
; Send, {Blind}
; Send, {vkE8}
Send, {Raw}%pass1%
Send, {Enter}
return

^#F6::
Send, {Raw}%pass2%
;Send, {Blind}
;Send, {vkE8}
Send, {Enter}
return

^#F7::
Send, {Raw}%pass3%
;Sleep, 150
Send, {Enter}
return

^#F8::
Send, {Raw}%pass4%
Send, {Enter}
return

; ========================================================================

; ^#F9::
; FileRead, jrmvar, C:\Users\%A_UserName%\var.txt 
; Send, %jrmvar%
; Send, {Enter}
; return

; ========================================================================

#Ins::
sleep, 150
Run, C:\Users\%A_UserName%\Desktop\WSL.lnk,,, process_id
;sleep, 150
WinWait, ahk_pid %process_id%
WinActivate, ahk_pid %process_id%
return

^#Ins::
sleep,150
Run, C:\Users\%A_UserName%\Desktop\WSL2.lnk,,, process_id3
WinWait, ahk_pid %process_id3%
WinActivate, ahk_pid %process_id3%
return

#Del::
sleep, 150
Run, C:\Users\%A_UserName%\Desktop\DBN.lnk,,, process_id2
WinWait, ahk_pid %process_id2%
WinActivate, ahk_pid %process_id2%
return

; ========================================================================

#o::  ; Press Win+O to turn on transparency for the window under the mouse.
WinSet, Transparent, 210, A
return

^#o::  ; Press Win+O to turn off transparency for the window under the mouse.
WinSet, Transparent, Off, A
return

;-Caption
#c::
WinSet, Style, -0x800000, A
;WinSet, Style, -0xc40000, A 
return
;

;+Caption
^#c::
WinSet, Style, +0xC00000, A
return
;


