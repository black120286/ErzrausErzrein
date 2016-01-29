var1 = 0
var2 = 0
var3 = 0
var4 = 0
var5 = 0
var6 = 0
var7 = 0
var8 = 0
Counter = 0
Lootthreshhold = 



Class Miner {
	Ident :=
	MinerName := "set"
	CargoPoint1_X1 := 
	CargoPoint1_Y1 := 
	CargoPoint1_X2 := 
	CargoPoint1_Y2 := 
	CargoPoint2_X1 := 
	CargoPoint2_Y1 := 
	CargoPoint2_X2 := 
	CargoPoint2_Y2 := 
	CargoStatus:= Object ( "leer", 0, "halb voll", 1,  "fast voll", 2, "looting", 3)
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
	IniRead, MinerName, Settings.ini, %A_Index%, MinerName, 0
	IniRead, CargoPoint1_X1, Settings.ini, %A_Index%, CargoPoint1_X1, 0
	IniRead, CargoPoint1_Y1, Settings.ini, %A_Index%, CargoPoint1_Y1, 0
	IniRead, CargoPoint1_X2, Settings.ini, %A_Index%, CargoPoint1_X2, 0
	IniRead, CargoPoint1_Y2, Settings.ini, %A_Index%, CargoPoint1_Y2, 0
	IniRead, CargoPoint2_X1, Settings.ini, %A_Index%, CargoPoint2_X1, 0
	IniRead, CargoPoint2_Y1, Settings.ini, %A_Index%, CargoPoint2_Y1, 0
	IniRead, CargoPoint2_X2, Settings.ini, %A_Index%, CargoPoint2_X2, 0
	IniRead, CargoPoint2_Y2, Settings.ini, %A_Index%, CargoPoint2_Y2, 0
	IniRead, ForgroundKey, Settings.ini, %A_Index%, ForgroundKey, 0

	Array.Insert(new Miner(MinerName, CargoPoint1_X1, CargoPoint1_Y1, CargoPoint1_X2, CargoPoint1_Y2, CargoPoint2_X1, CargoPoint2_Y1, CargoPoint2_X2, CargoPoint2_Y2, ForgroundKey))
}


gui, add, Button, x30 y230 w100 h50 gstart, Start
gui, add, Button, x30 y200 w100 h50 gWorking, Working/STOP IT !
Gui, Add, Listview,x10 y10 r10 w200 Grid vMyListView, MinerName|CargoStatus
gui, add, Button, x30 y300 w100 h50 gLootnow, Lootnow
gui, add, checkbox, x140 y230 vcheckbox1, Looting
gui, add, checkbox, x140 y320 vcheckbox2, Loot regardsless of cargo
Gui, Add, Text, r4 x250 y100, % "Loot at"
Gui, Add, Text, x300 y100 w200 vEdit gLetter, 40
gui, add, checkbox, x240 y60 vcheckbox3, Erst nach 2tem Cycle looten
GuiControl, hide, Working



for index, value in Array
	LV_Add("", value.MinerName, value.CargoStatus)


Gui, Show,w500 h600
SetTimer, Update, 500
Settimer, loottimer, 10000
return


Letter:
return

Update:

For index, value in Array
	LV_Modify(index, "", value.MinerName, value.CargoStatus)

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
var1 := 0
Loop
{
	ToolTip, % ED -= 1
	If(ED > 0) || (S = 1)
	{
	
		for index, value in Array {
			CoordMode, Pixel, Screen
			PixelSearch, FoundX, FoundY, value.CargoPoint1_X1, value.CargoPoint1_Y1, value.CargoPoint1_X2, value.CargoPoint1_Y2, 0x04495D, 3, Fast RGB
			If ErrorLevel = 0
			{
				Array[index].CargoStatus :=1
			}
			CoordMode, Pixel, Screen
			PixelSearch, FoundX, FoundY, value.CargoPoint2_X1, value.CargoPoint2_Y1, value.CargoPoint2_X2, value.CargoPoint2_Y2, 0x04495D, 3, Fast RGB
			If ErrorLevel = 0
			{
				Array[index].CargoStatus :=2
			}
			Array[index].CargoStatus := 3 ; ist später auszukommentieren
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
			RunWait, Randomizirator.ahk, MMS
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
			RunWait, Randomizirator.ahk, MMS
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
		RunWait, Randomizirator.ahk, MMS
	}
}
Return
