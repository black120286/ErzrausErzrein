
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
	Button1Status :=
	Button2Status :=
	Button3Status :=
	Button1Point1_X :=
	Button1Point1_Y :=
	Button1Point2_X :=
	Button1Point2_Y :=
	Button2Point1_X :=
	Button2Point1_Y :=
	Button2Point2_X :=
	Button2Point2_Y :=
	Button3Point1_X :=
	Button3Point1_Y :=
	Button3Point2_X :=
	Button3Point2_Y :=
	
	__New(minername, cargo_point1_x1, cargo_point1_y1, cargo_point1_x2, cargo_point1_y2, cargo_point2_x1, cargo_point2_y1, cargo_point2_x2, cargo_point2_y2, foregroundkey, button1point1_x, button1point1_y, button1point2_x, button1point2_y, button2point1_x, button2point1_y, button2point2_x, button2point2_y,button3point1_x, button3point1_y, button3point2_x, button3point2_y){
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
		this.Button1Point1_X := button1point1_x
		this.Button1Point1_Y := button1point1_y
		this.Button1Point2_X := button1point2_x
		this.Button1Point2_Y := button1point2_y
		this.Button2Point1_X :=	button2point1_x
		this.Button2Point1_Y := button2point1_y
		this.Button2Point2_X := button2point2_x
		this.Button2Point2_Y := button2point2_y
		this.Button3Point1_X := button3point1_x
		this.Button3Point1_Y := button3point1_y
		this.Button3Point2_X := button3point2_x
		this.Button3Point2_Y := button3point2_y
		
	}		
}


Array := []

readIniFile()
{
	global Array
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
			IniRead, g_Button1Point1_X, Settings.ini, %A_Index%, Button1x11, 0
			IniRead, g_Button1Point1_Y, Settings.ini, %A_Index%, Button1y11, 0
			IniRead, g_Button1Point2_X, Settings.ini, %A_Index%, Button1x12, 0
			IniRead, g_Button1Point2_Y, Settings.ini, %A_Index%, Button1y12, 0
			IniRead, g_Button2Point1_X, Settings.ini, %A_Index%, Button2x11, 0
			IniRead, g_Button2Point1_Y, Settings.ini, %A_Index%, Button2y11, 0
			IniRead, g_Button2Point2_X, Settings.ini, %A_Index%, Button2x12, 0
			IniRead, g_Button2Point2_Y, Settings.ini, %A_Index%, Button2y12, 0
			IniRead, g_Button3Point1_X, Settings.ini, %A_Index%, Button3x11, 0
			IniRead, g_Button3Point1_Y, Settings.ini, %A_Index%, Button3y11, 0
			IniRead, g_Button3Point2_X, Settings.ini, %A_Index%, Button3x12, 0
			IniRead, g_Button3Point2_Y, Settings.ini, %A_Index%, Button3y12, 0

			Array.Insert(new Miner(g_MinerName, g_CargoPoint1_X1, g_CargoPoint1_Y1, g_CargoPoint1_X2, g_CargoPoint1_Y2, g_CargoPoint2_X1, g_CargoPoint2_Y1, g_CargoPoint2_X2, g_CargoPoint2_Y2, g_ForegroundKey, g_Button1Point1_X, g_Button1Point1_Y, g_Button1Point2_X, g_Button1Point2_Y, 		g_Button2Point1_X, g_Button2Point1_Y, g_Button2Point2_X, g_Button2Point2_Y, g_Button3Point1_X, g_Button3Point1_Y, g_Button3Point2_X, g_Button3Point2_Y))
		}
	Return
}

MouseMovementArray := []

Loop, MMS\*.*
{
	MouseMovementArray.Insert(A_LoopFileName)
}




gui, add, Button, x30 y230 w100 h50 gStart, Start
gui, add, Button, x30 y230 w100 h50 gStart2, Start Again
gui, add, Button, x30 y300 w100 h50 gWorking, STOP IT !
Gui, Add, Listview,x10 y10 r10 w250 Grid vMyListView, MinerName|CargoStatus|B1|B2|B3
gui, add, Button, x30 y370 w100 h50 gLootnow, Lootnow
gui, add, checkbox, x140 y250 vcheckbox1, Looting
gui, add, checkbox, x140 y390 vcheckbox2, Loot regardsless of cargo
Gui, Add, Text, r4 x320 y100, % "Loot at"
Gui, Add, Text, x320 y100 w200 vEdit gLetter, 40
Gui, Add, Edit, x320 y130 w150 vEdittext, LoopCycles-Start: 0
Gui, Add, Edit, x320 y160 w150 vEdittext2, LOOTS !!!!: 0
Gui, Add, Edit, x320 y190 w150 vEdittext3, MouseScript:
gui, add, checkbox, x320 y60 vcheckbox3, Erst nach 2tem Cycle looten
GuiControl, hide, Start Again

Hotkey, Home, Working
FormatTime, TimeString2
readIniFile()
FileAppend, -------  New Session started: %TimeString2% ------- `n, MinerLog.txt



for index, value in Array
	LV_Add("", value.MinerName, value.CargoStatus)


Gui, Show,w500 h800
SetTimer, Update, 1500
Settimer, Loottimer, 3500
counter2 := 0
counter := 0




Up::GuiControl, , checkbox1, 1
Down::GuiControl, , checkbox1, 0


Letter:
return

Update:
For index6, value6 in Array
{	
	checkButtonsOfMiner(index6, 1, value6.Button1Point1_X, value6.Button1Point1_Y, value6.Button1Point2_X, value6.Button1Point2_Y)
	checkButtonsOfMiner(index6, 2, value6.Button2Point1_X, value6.Button2Point1_Y, value6.Button2Point2_X, value6.Button2Point2_Y)
	checkButtonsOfMiner(index6, 3, value6.Button3Point1_X, value6.Button3Point1_Y, value6.Button3Point2_X, value6.Button3Point2_Y)
	if(value6.CargoStatus = 0)
		CargoStatus := "leer"
	else if (value6.CargoStatus = 1)
		CargoStatus := "Halb voll"
	else if (value6.CargoStatus = 2)
		CargoStatus := "Fast voll"
	else if (value6.CargoStatus = 3)
		CargoStatus := "am looten"	
	LV_Modify(index6, "", value6.MinerName, CargoStatus, value6.Button1Status, value6.Button2Status, value6.Button3Status)
}
Return



GuiClose:
ExitApp

Left::exitapp

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
GuiControl, hide, Start
GuiControl, Show, Start Again
s := 1
Loop
{	
	If(s = 1)
	{
		counter += 1
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
		
	}
	GuiControl ,, Edittext, LoopCycles-Start: %counter%
}
Return

Start2:
s := 1
Return


Loottimer:
gui, submit, nohide

IF (checkbox1 = 1)
{	
	
	
	for index1, value2 in Array
	{	
		
		Settimer, Loottimer, Off
		If (value2.CargoStatus- checkbox3) > 0
		{	
			if(checkbox1 = 1)
			{
				Sleep, % ran(800, 2050)
				keytopush := value2.ForegroundKey
				Send, {%keytopush% Down}
				Sleep, % ran(50, 150)
				Send, {%keytopush% Up}
				Sleep, % ran(50, 150)
				mousescript := MouseMovement(MouseMovementArray)
				Array[index1].CargoStatus := 0
				counter2+= 1
				writeInLog(value4.Minername, mousescript, counter2)
				GuiControl ,, Edittext2, LOOTS !!!!: %counter2%
			}
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
Return


Lootnow:
s := 0
Settimer, Loottimer, Off
If ( checkbox2 = 0)
{
	for index3, value3 in Array
	{
		If ((value3.CargoStatus - checkbox3)> 0)
		{
			Sleep, % ran(800, 2050)
			keytopush := value3.ForegroundKey
			Send, {%keytopush% Down}
			Sleep, % ran(50, 150)
			Send, {%keytopush% Up}
			Sleep, % ran(50, 150)
			mousescript := MouseMovement(MouseMovementArray)
			Array[index3].CargoStatus := 0
			counter2+= 1
			writeInLog(value4.Minername, mousescript, counter2)
			GuiControl ,, Edittext2, LOOTS !!!!: %counter2%
		}
	}
}

else
{
	for index4, value4 in Array
	{	
		Sleep, % ran(800, 2050)
		keytopush := value4.ForegroundKey
		Send, {%keytopush% Down}
		Sleep, % ran(50, 150)
		Send, {%keytopush% Up}
		Sleep, % ran(50, 150)
		mousescript := MouseMovement(MouseMovementArray)
		Array[index4].CargoStatus := 0
		counter2+= 1
		writeInLog(value4.Minername, mousescript, counter2)
		GuiControl ,, Edittext2, LOOTS !!!!: %counter2%
	}
}
s := 1
Settimer, Loottimer, On
Return


MouseMovement(MouseMovementArray)
{
	randomscript := ran(MouseMovementArray.MinIndex() ,MouseMovementArray.MaxIndex())
	mousescript := MouseMovementArray[randomscript]
	GuiControl ,, Edittext3, MousScript: %mousescript%
	RunWait, %mousescript%, MMS
	return mousescript
}


writeInLog(minername, mousescript, counter){
		FormatTime, TimeString, T12, yyyy-MM-dd, hh:mm:ss tt
		FileAppend, `t %counter%. `t %TimeString% || %minername% || %mousescript% `n, MinerLog.txt
}

checkButtonIsActive(cord1_x, cord1_y, cord2_x, cord2_y){
	CoordMode, Pixel, Screen
	ImageSearch, FoundX, FoundY, cord1_x, cord1_y, cord2_x, cord2_y, *60 activ.png
	If ErrorLevel = 0
	{
		Return true
	}
	else
	{
		Return false
	}
}

checkButtonIsInactive(cord1_x, cord1_y, cord2_x, cord2_y){
	CoordMode, Pixel, Screen
	ImageSearch, FoundX, FoundY, cord1_x, cord1_y, cord2_x, cord2_y, *50 inactiv.png
	If ErrorLevel = 0
	{
		Return true
	}
	else
	{
		Return false
	}
}

checkButtonsOfMiner(ident, buttonnumber, cord1, cord2, cord3, cord4)
{	
	if(checkButtonIsActive(cord1, cord2, cord3, cord4))
	{
		setButtonStatus(ident, buttonnumber, "On")
		return
	}
	else if(checkButtonIsInactive(cord1, cord2, cord3, cord4))
	{
		setButtonStatus(ident, buttonnumber, "Off")
		return
	}
	return
	
}

setButtonStatus(ident, number, status)
{
	global Array
	if(number = 1)
	{
		Array[ident].Button1Status := status
		return
	}
	else if (number = 2) 
	{
		Array[ident].Button2Status := status
		return
	}
	
	else if (number = 3)
	{
		Array[ident].Button3Status := status
		return
	}
	return
}
