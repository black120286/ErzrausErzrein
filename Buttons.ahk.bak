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



Iniread, Cordx1, %A_workingDir%,Settings, Orehold%Buttonnumber%
Iniread, Cordx2, %A_workingDir%,Settings, Orehold%Buttonnumber%
Iniread, Cordy1, %A_workingDir%,Settings, Orehold%Buttonnumber%
Iniread, Cordy2, %A_workingDir%,Settings, Orehold%Buttonnumber%
F3::
Macro1:
Loop
{



Buttonchecker:
Sleep, 500
CoordMode, Pixel, Screen
ImageSearch, FoundX, FoundY, %cordx1%, %Cordy1%, %Cordx2%, %Cordy2%, *60 %A_workingDir% activ.png
If ErrorLevel
{
Sleep, 500
CoordMode, Pixel, Screen
ImageSearch, FoundX, FoundY, %cordx1%, %Cordy1%, %Cordx2%, %Cordy2%, *60 %A_workingDir% activ.png
If ErrorLevel
{
CoordMode, Pixel, Screen
ImageSearch, FoundX, FoundY, %cordx1%, %cordy1%, %cordx2%, %cordy2%, *50 %A_workingDir% inactiv.png
If ErrorLevel = 0
{
Sleep, 500
CoordMode, Pixel, Screen
ImageSearch, FoundX, FoundY, %cordx1%, %cordy1%, %cordx2%, %cordy2%, *50 %A_workingDir% inactiv.png
If ErrorLevel = 0
{
Buttonoffline:
}
}
}
}
}
Return