; This script was created using Pulover's Macro Creator

#NoEnv
SetWorkingDir %A_ScriptDir%
CoordMode, Mouse, Window
SendMode Input
#SingleInstance Force
SetTitleMatchMode 2
DetectHiddenWindows On
#WinActivateForce
SetControlDelay 1
SetWinDelay 0
SetKeyDelay -1
SetMouseDelay -1
SetBatchLines -1


F3::
Macro1:
Loop
{
Sleep, 500
CoordMode, Pixel, Screen
PixelSearch, FoundX, FoundY, %BumsdeOverview_x1%, %BumsdeOverview_y1%, %BumsdeOverview_x2, %BumsdeOverview_y2%, 0xCE1616, 5, Fast RGB
If ErrorLevel = 0
{
MsgBox, 0, , Mate! die ratten müssen gebasht werden!
}
}
Return

