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
Abstandlootbalken = 1

 


Class Miner {
	Ident :=
	MinerName := "set"
	CargoPoint1 := 
	CargoPoint2 := 
	CargoStatus:= Object ( "leer", 0, "halb voll", 1,  "fast voll", 2, "looting", 3) 
	
	__New(minername){
		this.MinerName := minername
	}
	
	
}


Kalisia := new Miner("Kalisia")
Shiru := new Miner("Shiru")
Shizzo := new Miner("Shizzo")
BigBoss := new Miner("BigBoss")
MuskelUwe := new Miner("MuskelUwe")
Sirbob := new Miner("Sirbob2")
Maruminer1 := new Miner("Maruminer1")
Maruminer2 := new Miner("Maruminer2")

Array := []
Array.Insert(Kalisia)
Array.Insert(Shiru)
Array.Insert(Shizzo)
Array.Insert(BigBoss)
Array.Insert(MuskelUwe)
Array.Insert(Sirbob)
Array.Insert(Maruminer1)
Array.Insert(Maruminer2)





gui, add, Button, x30 y230 w100 h50 gstart, Start
gui, add, Button, x30 y200 w100 h50 gWorking, Working/STOP IT !
Gui, Add, Listview,x10 y10 r10 w200 Grid vMyListView, MinerName|CargoStatus
gui, add, Button, x30 y300 w100 h50 gLootnow, Lootnow
gui, add, checkbox, x140 y230 vcheckbox1, Looting
gui, add, checkbox, x140 y320 vcheckbox2, Loot regardsless of cargo
Gui, Add, Text, r4 x250 y100, % "Loot at"
Gui, Add, Text, x300 y100 w200 vEdit gLetter, 40
GuiControl, hide, Working
Gui, Add, DropDownList, x270 y30 w200 vDDL gDDL, 1||2



for index, value in Array
	LV_Add("", value.MinerName, value.CargoStatus)






Gui, Show,w500 h600
SetTimer, Update, 500
Settimer, loottimer, 10000
return











ddl:

Gui, Submit, NoHide
 if (DDL = "1")
 {       GuiControl,, Edit, 40
    Varb1 =%Var1%
	Varb2 =%Var2%
	Varb3 =%Var3%
	Varb4 =%Var4%
	Varb5 =%Var5%
	Varb6 =%Var6%
	Varb7 =%Var7%
	Varb8 =%Var8%
}
if (DDL = "2")
 {       GuiControl,, Edit, 50
	
    Varb1 =%Var1%
	Varb2 =%Var2%
	Varb3 =%Var3%
	Varb4 =%Var4%
	Varb5 =%Var5%
	Varb6 =%Var6%
	Varb7 =%Var7%
	Varb8 =%Var8% 
	Varb1 -= 1
	Varb2 -= 1
	Varb3 -= 1
	Varb4 -= 1
	Varb5 -= 1
	Varb6 -= 1
	Varb7 -= 1
	Varb8 -= 1
}
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
	PixelSearch, FoundX, FoundY, %Cargoposx1%, %Cargoposy1%, %Cargoposx2%, %Cargoposy2%, 0x04495D, 3, Fast RGB
	If ErrorLevel = 0
	{
		Array[index].CargoStatus :=1
	}
	CoordMode, Pixel, Screen
	PixelSearch, FoundX, FoundY, 20, 0, 30, 1, 0x04495D, 3, Fast RGB
	If ErrorLevel = 0
	{
		Array[index].CargoStatus :=2
	}
	Array[index].CargoStatus := 3 ; ist sp�ter auszukommentieren

Cargoposy1 += %AbstandLootbalken1%
Cargoposy2 += %AbstandLootbalken1%
Cargopos2y1 += %Abstandlootbalken1%
Cargopos2y2 += %Abstandlootbalken1%

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
IF checkbox1 = 1
{
If varb1 > 0
{
	Send, {F3 Down}
	Sleep, % ran(50, 150)
	Send, {F2 Up}
	RunWait, Randomizirator.ahk, MMS
}
If varb2 > 0
{
	Send, {F4 Down}
	Sleep, % ran(50, 150)
	Send, {F3 Up}
	RunWait, Randomizirator.ahk, MMS

}
If varb3 > 0
{	
	Send, {F5 Down}
	Sleep, % ran(50, 150)
	Send, {F4 Up}
	RunWait, Randomizirator.ahk, MMS
}
If varb4 > 0
{
	Send, {F6 Down}
	Sleep, % ran(50, 150)
	Send, {F5 Up}
	RunWait, Randomizirator.ahk, MMS
}
If varb5 > 0
{	
	Send, {F7 Down}
	Sleep, % ran(50, 150)
	Send, {F6 Up}
	RunWait, Randomizirator.ahk, MMS
}
If varb6 > 0
{	
	Send, {F8 Down}
	Sleep, % ran(50, 150)
	Send, {F7 Up}
	RunWait, Randomizirator.ahk, MMS
}
If varb7 > 0
{	
	Send, {F9 Down}
	Sleep, % ran(50, 150)
	Send, {F8 Up}
	RunWait, Randomizirator.ahk, MMS
}
If varb8 > 0
{	
	Send, {F10 Down}
	Sleep, % ran(50, 150)
	Send, {F9 Up}
	RunWait, Randomizirator.ahk, MMS
}
}
Return

ran(min, max)
 {
   random, ran, min, max
   return ran
 }
 
 Return
 
 
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
If varb1 > 0
{
	Send, {F3 Down}
	Sleep, % ran(50, 150)
	Send, {F3 Up}
	RunWait, Randomizirator.ahk, MMS
}
If varb2 > 0
{
	Send, {F4 Down}
	Sleep, % ran(50, 150)
	Send, {F4 Up}
	RunWait, Randomizirator.ahk, MMS

}
If varb3 > 0
{	
	Send, {F5 Down}
	Sleep, % ran(50, 150)
	Send, {F5 Up}
	RunWait, Randomizirator.ahk, MMS
}
If varb4 > 0
{
	Send, {F6 Down}
	Sleep, % ran(50, 150)
	Send, {F6 Up}
	RunWait, Randomizirator.ahk, MMS
}
If varb5 > 0
{	
	Send, {F7 Down}
	Sleep, % ran(50, 150)
	Send, {F7 Up}
	RunWait, Randomizirator.ahk, MMS
}
If varb6 > 0
{	
	Send, {F8 Down}
	Sleep, % ran(50, 150)
	Send, {F8 Up}
	RunWait, Randomizirator.ahk, MMS
}
If varb7 > 0
{	
	Send, {F9 Down}
	Sleep, % ran(50, 150)
	Send, {F9 Up}
	RunWait, Randomizirator.ahk, MMS
}
If varb8 > 0
{	
	Send, {F10 Down}
	Sleep, % ran(50, 150)
	Send, {F10 Up}
	RunWait, Randomizirator.ahk, MMS
}
}
else
	msgbox ,,, aa
	Send, {F3 Down}
	Sleep, % ran(50, 150)
	Send, {F3 Up}
	RunWait, Randomizirator.ahk, MMS
	sleep, % ran(50, 150)
	Send, {F4 Down}
	Sleep, % ran(50, 150)
	Send, {F4 Up}
	RunWait, Randomizirator.ahk, MMS
	sleep, % ran(50, 150)
	Send, {F5 Down}
	Sleep, % ran(50, 150)
	Send, {F5 Up}
	RunWait, Randomizirator.ahk, MMS
	sleep, % ran(50, 150)
	Send, {F6 Down}
	Sleep, % ran(50, 150)
	Send, {F6 Up}
	RunWait, Randomizirator.ahk, MMS
	sleep, % ran(50, 150)
	Send, {F7 Down}
	Sleep, % ran(50, 150)
	Send, {F7 Up}
	RunWait, Randomizirator.ahk, MMS
	sleep, % ran(50, 150)
	Send, {F8 Down}
	Sleep, % ran(50, 150)
	Send, {F8 Up}
	RunWait, Randomizirator.ahk, MMS
	sleep, % ran(50, 150)
	Send, {F9 Down}
	Sleep, % ran(50, 150)
	Send, {F9 Up}
	RunWait, Randomizirator.ahk, MMS
	sleep, % ran(50, 150)
	Send, {F10 Down}
	Sleep, % ran(50, 150)
	Send, {F10 Up}
	RunWait, Randomizirator.ahk, MMS
	sleep, % ran(50, 150)
