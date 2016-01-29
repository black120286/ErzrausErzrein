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



Iniread, 1Cordx1, %A_workingDir%,Settings, Kalisia, Button1x11
Iniread, 1Cordx2, %A_workingDir%,Settings, Kalisia, Button1x12
Iniread, 1Cordy1, %A_workingDir%,Settings, Kalisia, Button1y11
Iniread, 1Cordy2, %A_workingDir%,Settings, Kalisia, Button1y12
Iniread, 2Cordx1, %A_workingDir%,Settings, Kalisia, Button2x11
Iniread, 2Cordx2, %A_workingDir%,Settings, Kalisia, Button2x12
Iniread, 2Cordy1, %A_workingDir%,Settings, Kalisia, Button2y11
Iniread, 2Cordy2, %A_workingDir%,Settings, Kalisia, Button2y12
Iniread, 3Cordx1, %A_workingDir%,Settings, Kalisia, Button3x11
Iniread, 3Cordx2, %A_workingDir%,Settings, Kalisia, Button3x12
Iniread, 3Cordy1, %A_workingDir%,Settings, Kalisia, Button3y11
Iniread, 3Cordy2, %A_workingDir%,Settings, Kalisia, Button3y12

Macro1:
Loop
{



Buttonchecker:
	Sleep, 500
	CoordMode, Pixel, Screen
	ImageSearch, FoundX, FoundY, %1cordx1%, %1Cordy1%, %1Cordx2%, %1Cordy2%, *60 %A_workingDir% activ.png
	If ErrorLevel
	{
		Sleep, 500
		CoordMode, Pixel, Screen
		ImageSearch, FoundX, FoundY, %1Cordx1%, %1Cordy1%, %1Cordx2%, %1Cordy2%, *60 %A_workingDir% activ.png
		If ErrorLevel
		{
			CoordMode, Pixel, Screen
			ImageSearch, FoundX, FoundY, %1cordx1%, %1cordy1%, %1cordx2%, %1cordy2%, *50 %A_workingDir% inactiv.png
			If ErrorLevel = 0
			{
				Sleep, 500
				CoordMode, Pixel, Screen
				ImageSearch, FoundX, FoundY, %1cordx1%, %1cordy1%, %1cordx2%, %1cordy2%, *50 %A_workingDir% inactiv.png
				If ErrorLevel = 0
				{
					Button1offline:
				}
			}
		}
	}

	Sleep, 500
	CoordMode, Pixel, Screen
	ImageSearch, FoundX, FoundY, %2cordx1%, %2Cordy1%, %2Cordx2%, %2Cordy2%, *60 %A_workingDir% activ.png
	If ErrorLevel
	{
		Sleep, 500
		CoordMode, Pixel, Screen
		ImageSearch, FoundX, FoundY, %2cordx1%, %2Cordy1%, %2Cordx2%, %2Cordy2%, *60 %A_workingDir% activ.png
		If ErrorLevel
		{
			CoordMode, Pixel, Screen
			ImageSearch, FoundX, FoundY, %2cordx1%, %2cordy1%, %2cordx2%, %2cordy2%, *50 %A_workingDir% inactiv.png
			If ErrorLevel = 0
			{
				Sleep, 500
				CoordMode, Pixel, Screen
				ImageSearch, FoundX, FoundY, %2cordx1%, %2cordy1%, %2cordx2%, %2cordy2%, *50 %A_workingDir% inactiv.png
				If ErrorLevel = 0
				{
					Button2offline:
				}
			}
		}
	}

	Sleep, 500
	CoordMode, Pixel, Screen
	ImageSearch, FoundX, FoundY, %3cordx1%, %3Cordy1%, %3Cordx2%, %3Cordy2%, *60 %A_workingDir% activ.png
	If ErrorLevel
	{
		Sleep, 500
		CoordMode, Pixel, Screen
		ImageSearch, FoundX, FoundY, %3cordx1%, %3Cordy1%, %3Cordx2%, %3Cordy2%, *60 %A_workingDir% activ.png
		If ErrorLevel
		{
			CoordMode, Pixel, Screen
			ImageSearch, FoundX, FoundY, %3cordx1%, %3cordy1%, %3cordx2%, %3cordy2%, *50 %A_workingDir% inactiv.png
			If ErrorLevel = 0
			{
				Sleep, 500
				CoordMode, Pixel, Screen
				ImageSearch, FoundX, FoundY, %3cordx1%, %3cordy1%, %3cordx2%, %3cordy2%, *50 %A_workingDir% inactiv.png
				If ErrorLevel = 0
				{
					Button3offline:
				}
			}
		}
	}
}
Return