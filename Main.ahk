
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
	ForegroundKey :=
	
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
		this.ForegroundKey := foregroundkey
		
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
	IniRead, g_ForegroundKey, Settings.ini, %A_Index%, ForgroundKey, 0

	Array.Insert(new Miner(g_MinerName, g_CargoPoint1_X1, g_CargoPoint1_Y1, g_CargoPoint1_X2, g_CargoPoint1_Y2, g_CargoPoint2_X1, g_CargoPoint2_Y1, g_CargoPoint2_X2, g_CargoPoint2_Y2, g_ForegroundKey))
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
Gui, Add, Edit, x300 y130 w150 vEdittext, LoopCycles-Start: 0
Gui, Add, Edit, x300 y160 w150 vEdittext2, LOOTS !!!!: 0
Gui, Add, Edit, x300 y190 w150 vEdittext3, MouseScript:
gui, add, checkbox, x240 y60 vcheckbox3, Erst nach 2tem Cycle looten
GuiControl, hide, Working

Hotkey, Home, Working



for index, value in Array
	LV_Add("", value.MinerName, value.CargoStatus)


Gui, Show,w500 h800
SetTimer, Update, 500
Settimer, Loottimer, 1500
counter2 := 0
counter := 0


Letter:
return

Update:
For index6, value6 in Array
{
	if(value6.CargoStatus = 0)
		CargoStatus := "leer"
	else if (value6.CargoStatus = 1)
		CargoStatus := "Halb voll"
	else if (value6.CargoStatus = 2)
		CargoStatus := "Fast voll"
	else if (value6.CargoStatus = 3)
		CargoStatus := "am looten"	
	LV_Modify(index6, "", value6.MinerName, CargoStatus)
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
{	counter += 1
	ToolTip, % ED -= 1
	If(ED > 0) || (s = 1)
	{
	
		for index5, value5 in Array {
			CoordMode, Pixel, Screen
			x1 := value.CargoPoint2_X1
			y1 := value.CargoPoint2_Y1
			x2 := value.CargoPoint2_X2
			y2 := value.CargoPoint2_Y2
			ident := index5
			PixelSearch, FoundX, FoundY, value5.CargoPoint2_X1, value5.CargoPoint2_Y1, value5.CargoPoint2_X2, value5.CargoPoint2_Y2, 0x02495D, 10, Fast RGB
			;MsgBox, Chargo FastVoll? Ident = %ident% x1 = %x1%  || y1 = %y1%  || x2 = %x2% || y2 = %y2% || Ergebnis = %ErrorLevel%
			If ErrorLevel = 0
			{
				Array[ident].CargoStatus := 2
			}
			else
			{
				PixelSearch, FoundX, FoundY, value5.CargoPoint1_X1, value5.CargoPoint1_Y1, value5.CargoPoint1_X2, value5.CargoPoint1_Y2, 0x02495D, 10, Fast RGB
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
	
	GuiControl ,, Edittext, LoopCycles-Start: %counter%
}
Return




Loottimer:
gui, submit, nohide

IF (checkbox1 = 1)
{	
	
	
	for index1, value2 in Array
	{	
		
		Settimer, Loottimer, Off
		If value2.CargoStatus > 0
		{	
			Sleep, % ran(800, 1350)
			keytopush := value2.ForegroundKey
			Send, {%keytopush% Down}
			Sleep, % ran(50, 150)
			Send, {%keytopush% Up}
			MouseMovement(MouseMovementArray)
			Array[index1].CargoStatus := 0
			counter2+= 1
			GuiControl ,, Edittext2, LOOTS !!!!: %counter2%
			
		}
	}
}
Sleep, % ran(200, 800)
Settimer, Loottimer, On

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
s := 0
GuiControl, Enable, ED
GuiControl, Hide, Working
GuiControl, Show, Start
ToolTip
If ( checkbox2 = 0)
{
	for index3, value3 in Array
	{
		If ((value3.CargoStatus - checkbox3)> 0)
		{
			Sleep, % ran(800, 1350)
			keytopush := value3.ForegroundKey
			Send, {%keytopush% Down}
			Sleep, % ran(50, 150)
			Send, {%keytopush% Up}
			MouseMovement(MouseMovementArray)
			Array[index3].CargoStatus := 0
			counter2+= 1
			GuiControl ,, Edittext2, LOOTS !!!!: %counter2%
		}
	}
}

else
{
	for index4, value4 in Array
	{	
		Sleep, % ran(800, 1350)
		keytopush := value4.ForegroundKey
		Send, {%keytopush% Down}
		Sleep, % ran(50, 150)
		Send, {%keytopush% Up}
		MouseMovement(MouseMovementArray)
		Array[index4].CargoStatus := 0
		counter2+= 1
		GuiControl ,, Edittext2, LOOTS !!!!: %counter2%
	}
}
s := 1
Return


MouseMovement(MouseMovementArray)
{
	randomscript := ran(MouseMovementArray.MinIndex() ,MouseMovementArray.MaxIndex())
	mousescript := MouseMovementArray[randomscript]
	GuiControl ,, Edittext3, MousScript: %mousescript%
	RunWait, %mousescript%, MMS
	Return
}
