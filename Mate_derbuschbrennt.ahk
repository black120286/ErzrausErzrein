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


Macro1:
Loop
{
Hpchecker:
CoordMode, Pixel, Screen
PixelSearch, FoundX, FoundY, 1553, 1730, 1560, 1736, 0xD01818, 20, Fast RGB
If ErrorLevel = 0
	SoundBeep
CoordMode, Pixel, Screen
PixelSearch, FoundX, FoundY, 1703, 1730, 1710, 1736, 0xD01818, 20, Fast RGB
CoordMode, Pixel, Screen
PixelSearch, FoundX, FoundY, 1853, 1730, 1861, 1736, 0xD01818, 20, Fast RGB
CoordMode, Pixel, Screen
PixelSearch, FoundX, FoundY, 2003, 1730, 2010, 1736, 0xD01818, 20, Fast RGB
CoordMode, Pixel, Screen
PixelSearch, FoundX, FoundY, 1553, 1880, 1560, 1886, 0xD01818, 20, Fast RGB
CoordMode, Pixel, Screen
PixelSearch, FoundX, FoundY, 1703, 1880, 1710, 1886, 0xD01818, 20, Fast RGB
CoordMode, Pixel, Screen
PixelSearch, FoundX, FoundY, 1853, 1880, 1861, 1886, 0xD01818, 20, Fast RGB
CoordMode, Pixel, Screen
PixelSearch, FoundX, FoundY, 2003, 1880, 2010, 1886, 0xD01818, 20, Fast RGB
If ErrorLevel = 0
{
MsgBox, 0, , mate ! der busch brennt ! 
}
}
Return

