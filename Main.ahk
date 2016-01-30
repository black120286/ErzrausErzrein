
Class Miner {
	Ident :=
	MinerName := 
	CargoPoint1_X1 := 
	CargoPoint1_Y1 := 
	CargoPoint1_X2 := 
	CargoPoint1_Y2 := 
	CargoPoint2_X1 := 
	CargoPoint2_Y1 := 
	CargoPoint2_X2 := 
	CargoPoint2_Y2 := 
	CargoStatus:= 0
	ForgroundKey :=
	
	__New(minername, cargo_point1_x1, cargo_point1_y1, cargo_point1_x2, cargo_point1_y2, cargo_point2_x1, cargo_point2_y1, cargo_point2_x2, cargo_point2_y2, foregroundkey){
		this.MinerName := minername
		this.CargoPoint1_X1 := cargo_point1_x1
		this.CargoPoint1_Y1 := cargo_point1_y1
		this.CargoPoint1_X2 := cargo_point1_x2
		this.CargoPoint1_Y2 := cargo_point1_y2
		this.CargoPoint2_X1 := cargo_point2_x1
		this.CargoPoint2_Y1 := cargo_point2_y1
		this.CargoPoint2_X2 := cargo_point2_x2
		this.CargoPoint2_Y2 := cargo_point2_y2
		this.ForgroundKey := foregroundkey
		
	}		
}


Array := []

Loop , 8
{
	IniRead, g_MinerName, Settings.ini, %A_Index%, MinerName, 0
	IniRead, g_CargoPoint1_X1, Settings.ini, %A_Index%, CargoPoint1_X1, 0
	IniRead, g_CargoPoint1_Y1, Settings.ini, %A_Index%, CargoPoint1_Y1, 0
	IniRead, g_CargoPoint1_X2, Settings.ini, %A_Index%, CargoPoint1_X2, 0
	IniRead, g_CargoPoint1_Y2, Settings.ini, %A_Index%, CargoPoint1_Y2, 0
	IniRead, g_CargoPoint2_X1, Settings.ini, %A_Index%, CargoPoint2_X1, 0
	IniRead, g_CargoPoint2_Y1, Settings.ini, %A_Index%, CargoPoint2_Y1, 0
	IniRead, g_CargoPoint2_X2, Settings.ini, %A_Index%, CargoPoint2_X2, 0
	IniRead, g_CargoPoint2_Y2, Settings.ini, %A_Index%, CargoPoint2_Y2, 0
	IniRead, g_ForgroundKey, Settings.ini, %A_Index%, ForgroundKey, 0

	Array.Insert(new Miner(g_MinerName, g_CargoPoint1_X1, g_CargoPoint1_Y1, g_CargoPoint1_X2, g_CargoPoint1_Y2, g_CargoPoint2_X1, g_CargoPoint2_Y1, g_CargoPoint2_X2, g_CargoPoint2_Y2, g_ForgroundKey))
}

MouseMovementArray := []

Loop, MMS\*.*
{
	MouseMovementArray.Insert(A_LoopFileName)
}




gui, add, Button, x30 y230 w100 h50 gstart, Start
gui, add, Button, x30 y230 w100 h50 gWorking, Working/STOP IT !
Gui, Add, Listview,x10 y10 r10 w200 Grid vMyListView, MinerName|CargoStatus
gui, add, Button, x30 y300 w100 h50 gLootnow, Lootnow
gui, add, checkbox, x140 y230 vcheckbox1, Looting
gui, add, checkbox, x140 y320 vcheckbox2, Loot regardsless of cargo
Gui, Add, Text, r4 x250 y100, % "Loot at"
Gui, Add, Text, x300 y100 w200 vEdit gLetter, 40
gui, add, checkbox, x240 y60 vcheckbox3, Erst nach 2tem Cycle looten
GuiControl, hide, Working

Hotkey, Home, Working



for index, value in Array
	LV_Add("", value.MinerName, value.CargoStatus)


Gui, Show,w500 h600
SetTimer, Update, 500
Settimer, Loottimer, 10000
return


Letter:
return

Update:

For index, value in Array
{
	if(value.CargoStatus = 0)
		CargoStatus := "leer"
	else if (value.CargoStatus = 1)
		CargoStatus := "Halb voll"
	else if (value.CargoStatus = 2)
		CargoStatus := "Fast voll"
	else if (value.CargoStatus = 3)
		CargoStatus := "am looten"	
	LV_Modify(index, "", value.MinerName, CargoStatus)
}
Return



GuiClose:
ExitApp

esc::exitapp

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





Start:
gui, submit, nohide
GuiControl, Disable, ED
GuiControl, Hide, Start 
GuiControl, Show, Working

s := 1
Loop
{
	ToolTip, % ED -= 1
	If(ED > 0) || (s = 1)
	{
	
		for index, value in Array {
			CoordMode, Pixel, Screen
			x1 := value.CargoPoint2_X1
			y1 := value.CargoPoint2_Y1
			x2 := value.CargoPoint2_X2
			y2 := value.CargoPoint2_Y2
			ident := index
			PixelSearch, FoundX, FoundY, value.CargoPoint2_X1, value.CargoPoint2_Y1, value.CargoPoint2_X2, value.CargoPoint2_Y2, 0x02495D, 10, Fast RGB
			;MsgBox, Chargo FastVoll? Ident = %ident% x1 = %x1%  || y1 = %y1%  || x2 = %x2% || y2 = %y2% || Ergebnis = %ErrorLevel%
			If ErrorLevel = 0
			{
				Array[ident].CargoStatus := 2
			}
			else
			{
				PixelSearch, FoundX, FoundY, value.CargoPoint1_X1, value.CargoPoint1_Y1, value.CargoPoint1_X2, value.CargoPoint1_Y2, 0x02495D, 10, Fast RGB
				;MsgBox, Chargo Halb Voll? Ident = %ident% x1 = %x1%  || y1 = %y1%  || x2 = %x2% || y2 = %y2% || Ergebnis = %ErrorLevel%
				If ErrorLevel = 0
				{
					Array[ident].CargoStatus :=1
				}
				else if ErrorLevel = 1
				{
					Array[ident].CargoStatus :=0
				}
			}					
	}
	}
	else
	{
		GuiControl, Enable, ED
		GuiControl, Show, Start
		GuiControl, hide, Working
		break
	}
}


Loottimer:
gui, submit, nohide
IF (checkbox1 = 1)
{	
	for index, value in Array
	{
		If value.CargoStatus > 0
		{
			Send, {value.ForegroundKey Down}
			Sleep, % ran(50, 150)
			Send, {value.ForegroundKey Up}
			MouseMovement(MouseMovementArray)
			Array[index].CargoStatus := 0
		}
	}
}
Return

ran(min, max)
 {
   random, ran, min, max
   return ran
 }

 
Working:
s := 0
GuiControl, Enable, ED
GuiControl, Hide, Working
GuiControl, Show, Start
ToolTip
Return


Lootnow:
S := 0
GuiControl, Enable, ED
GuiControl, Hide, Working
GuiControl, Show, Start
ToolTip
If ( checkbox2 = 0)
{
	for index, value in Array
	{
		If ((value.CargoStatus - checkbox3)> 0)
		{
			Send, {value.ForegroundKey Down}
			Sleep, % ran(50, 150)
			Send, {value.ForegroundKey Up}
			MouseMovement(MouseMovementArray)
			Array[index].CargoStatus := 0
		}
	}
}

else
{
	for index, value in Array
	{	
		Send, {value.ForegroundKey Down}
		Sleep, % ran(50, 150)
		Send, {value.ForegroundKey Up}
		MouseMovement(MouseMovementArray)
		Array[index].CargoStatus := 0
	}
}
Return


MouseMovement(MouseMovementArray)
{
	randomscript := ran(MouseMovementArray.MinIndex() ,MouseMovementArray.MaxIndex())
	mousescript := MouseMovementArray[randomscript]
	RunWait, %mousescript% , MMS
	Return
}
