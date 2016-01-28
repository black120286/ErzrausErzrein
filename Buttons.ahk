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

Iniread, Cordx1, %A_workingDir%, Orehold%Buttonnumber%
Iniread, Cordx2, %A_workingDir%, Orehold%Buttonnumber%
Iniread, Cordy1, %A_workingDir%, Orehold%Buttonnumber%
Iniread, Cordy2, %A_workingDir%, Orehold%Buttonnumber%

1:
Sleep, 500
CoordMode, Pixel, Screen
ImageSearch, FoundX, FoundY, %cordx1%, %Cordy1%, %Cordx2%, %Cordy2%, *60 C:\Users\Shiruh\Desktop\activ.png
If ErrorLevel
{
Sleep, 1000
CoordMode, Pixel, Screen
ImageSearch, FoundX, FoundY, %cordx1%, %Cordy1%, %Cordx2%, %Cordy2%, *60 C:\Users\Shiruh\Desktop\activ.png
If ErrorLevel
{
CoordMode, Pixel, Screen
ImageSearch, FoundX, FoundY, %cordx1%, %cordy1%, %cordx2%, %cordy2%, *50 C:\Users\Shiruh\Desktop\inactiv.png
If ErrorLevel = 0
{
Sleep, 500
CoordMode, Pixel, Screen
ImageSearch, FoundX, FoundY, %cordx1%, %cordy1%, %cordx2%, %cordy2%, *50 C:\Users\Shiruh\Desktop\inactiv.png
If ErrorLevel = 0
{
Buttonoff1:
Sleep, 500
}
}
}
}
}
Return

