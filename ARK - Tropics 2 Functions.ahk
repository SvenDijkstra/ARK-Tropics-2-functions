#SingleInstance,Force			;;REMOVE WHEN DONE DEBUGGING!
#NoEnv							; Recommended for performance and compatibility with future AutoHotkey releases.
;#Warn							; Enable warnings to assist with detecting common errors.
SendMode Input					; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir, %A_ScriptDir%	; Ensures a consistent starting directory.
;CoordMode, Relative				; Coordinates are relative to the active window.
CoordMode, Pixel, Screen			; Affects PixelGetColor, PixelSearch, and ImageSearch.


 
;;ARK TURQOISE COLOR 
;;0x795E00
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
toggle_tame := 0
tame_key := "none"

global xHealthL := convertPixelX(97.65625)	;left
global xHealthR := convertPixelX(98.59375)	;right
global yHealthT :=	convertPixelY(94.58333)	;top
global yHealthB :=	convertPixelY(98.88889)	;bottom

;F9::
;;MsgBox yHealthT=%yHealthT%
;;Sleep, 1000
;;getHealth()
;;producePoop()
;;autoFish()
;;checkTame()
;;tameAndrewsarchus()
;;bloodPackFarm()
;;checkFood()
;return


checkFood() {
IfWinNotActive ARK: Survival Evolved
		{
			ToolTip, ARK Survival Evolved`nis not active.
			return
		}
	PixelSearch, Px, Py, 2487, 1218, 2550, 1284, 0x7E670A, 75, Fast
	if (ErrorLevel = 2) {
		ToolTip, Couldn't find health values.
		return
	}
	else if (ErrorLevel = 1) {
		producePoop()
	}	
	else {
		foodLevel := 1280 - Py
		return foodLevel
	}
	
}

F9::
	;IfWinNotActive ARK: Survival Evolved
	;	return
	if toggle_tame = 0
		{
		SetTimer, bloodPackFarm, 2500
		toggle_tame = 1
		ToolTip, BLOOD PACK FARMING, 10, 50, 3
		}
	else
		{
		toggle_tame = 0
		SetTimer, bloodPackFarm, off
		Tooltip, , , , 3
		}
	return
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


eatCookedMeat() {
	if FileExist("D:\01-Scripts\Images\CookedMeat.bmp")
	ImageSearch, FoundX, FoundY, 148, 288, 925, 1270, *15 D:\01-Scripts\Images\CookedMeat.bmp
	if (ErrorLevel = 0)
	{
		MouseMove, %FoundX%, %FoundY%
		Sleep, 200
		SendInput, {e}
	}
	return
}


bloodPackFarm() {
	IfWinActive ARK: Survival Evolved
	{	
		if FileExist("D:\01-Scripts\Images\BP.bmp")
		ImageSearch, FoundX, FoundY, 148, 288, 925, 1270, *15 D:\01-Scripts\Images\BP.bmp
		if (ErrorLevel = 0)
		{
			MouseMove, %FoundX%, %FoundY%
			Sleep, 200
			SendInput, {t}
		}
		else
		{
			ToolTip, Can't find bloodpack
			currentHP := getHealth()
			if ( currentHP > 50 ) {
				ImageSearch, FoundX, FoundY, 148, 288, 925, 1270, *10 D:\01-Scripts\Images\Syringe.bmp
				if (ErrorLevel = 0)
				{
					MouseMove, %FoundX%, %FoundY%
					Sleep, 200
					SendInput, {e}					
				}
			}
			foodlevel := checkFood()
			ToolTip, CurrentHP = %currentHP%`nfoodlevel = %foodlevel%
			if ( foodlevel < 30 ) {
				eatCookedMeat()
			}
			producePoop()
		}
	}
	else
	{
		if WinExist("ARK: Survival Evolved") {
			WinActivate
		}
	}
}

;
;F9::
;	;IfWinNotActive ARK: Survival Evolved
;	;	return
;	if toggle_tame = 0
;		{
;		SetTimer, tameAndrewsarchus, 50
;		toggle_tame = 1
;		ToolTip, AUTO TAME, 10, 50, 3
;		}
;	else
;		{
;		toggle_tame = 0
;		SetTimer, tameAndrewsarchus, off
;		Tooltip, , , , 3
;		}
;	return
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


tameAndrewsarchus() {
	;IfWinActive ARK: Survival Evolved
	;{	
;;FIND LEFT WHITE
		;MsgBox tame_key=%tame_key%
		PixelSearch, Px, Py, 911, 765, 911, 765, 0XFBFFFF, 10, Fast
		if (ErrorLevel = 0)
		{
			if ( tame_key == "ä" ) {
				return
			}
			if ( tame_key == "d" ) {
				SendInput {d up}
				SendInput {a down}
				ToolTip KEY: A DOWN`nKEY: D UP, %LEFT%, %HOOG%, 3
				tame_key := "a"
			}
			if ( tame_key == "none" ) {
				SendInput {a down}
				ToolTip KEY: A DOWN`nKEY: D UP, %LEFT%, %HOOG%, 3
				tame_key := "a"
			}
			return
		}
		else
		{	
;;FIND LEFT GREEN
			PixelSearch, Px, Py, 911, 765, 911, 765, 0X00FA41, 75, Fast
			if (ErrorLevel = 0)
			{
				if ( tame_key == "ä" ) {
					return
				}
				if ( tame_key == "d" ) {
					SendInput {d up}
					SendInput {a down}
					ToolTip KEY: A DOWN`nKEY: D UP, %LEFT%, %HOOG%, 3
					tame_key := "a"
				}
				if ( tame_key == "none" ) {
					SendInput {a down}					
					ToolTip KEY: A DOWN`nKEY: D UP, %LEFT%, %HOOG%, 3
					tame_key := "a"
				}
				return
			}
			else
			{
;;FIND RIGHT WHITE
				PixelSearch, Px, Py, 1641, 748, 1641, 748, 0XFBFFFF, 10, Fast
                if (ErrorLevel = 0)
                {	
					if ( tame_key == "d" ) {
						return
					}
					if ( tame_key == "a" ) {
						SendInput {a up}
		        		SendInput {d down}
                		ToolTip KEY: A UP`nKEY: D DOWN, %RIGHT%, %HOOG%, 3
		        		tame_key := "d"	
		        	}
					if ( tame_key == "none" ) {
						SendInput {d down}
						ToolTip KEY: A UP`nKEY: D DOWN, %RIGHT%, %HOOG%, 3
						tame_key := "d"
					}
					return
		        }
		        else
		        {
;;FIND RIGHT GREEN				
					
					PixelSearch, Px, Py, 1641, 748, 1641, 748, 0x00FE42, 75, Fast
				    if (ErrorLevel 	= 0)
				    {
						;MsgBox Found right green
				    	if ( tame_key == "d" ) {
							return
						}
						if ( tame_key == "a" ) {
							SendInput {a up}
				    		SendInput {d down}
							ToolTip KEY: A UP`nKEY: D DOWN, %RIGHT%, %HOOG%, 3
				    		tame_key := "d"	
				    	}
						if ( tame_key == "none" ) {
							SendInput {d down}
							ToolTip KEY: A UP`nKEY: D DOWN, %RIGHT%, %HOOG%, 3
							tame_key := "d"
						}
						return
				    }
				    else 
				    {
				    	if ( tame_key == "none" ) {
				    	return
				    	}
				    	if ( tame_key == "a" ) {
				    		SendInput {a up}
				    		ToolTip KEY: A UP`nKEY: D UP, %MIDDLE%, %HOOG%, 3
				    		tame_key := "none"
				    	}
				    	if ( tame_key == "d" ) {
				    		SendInput {d up}
				    		ToolTip KEY: A UP`nKEY: D UP, %MIDDLE%, %HOOG%, 3
				    		tame_key := "none"
				    	}
				    }
				}
			}
		}
				
				
				
				
				
		
	;}
	;else
	;{
	;	if WinExist("ARK: Survival Evolved") {
	;		WinActivate
	;	}
	;}
}

;;;;tameKey(X) {
;;;;	tame_key := %X%
;;;;	if ( tame_key == "none" ) {
;;;;		return
;;;;	}
;;;;	if ( tame_key == "a" ) {
;;;;		SendInput {a up}
;;;;		tame_key := "none"
;;;;	}
;;;;	if ( tame_key == "d" ) {
;;;;		SendInput {d up}
;;;;		tame_key := "none"
;;;;	}			
;;;;	if ( tame_key != "a" ) {
;;;;		SendInput {a down}
;;;;		tame_key := "a"
;;;;	}
;;;;	if ( tame_key != "d" ) {
;;;;		SendInput {d down}
;;;;		tame_key := "d"			
;;;;	}
;;;;	ToolTip, Sending key %X% , 1247, 728, 1
;;;;}
;;;;
checkTame() {
	IfWinNotActive ARK: Survival Evolved
		{
			Tooltip, Ark not active
			return
		}
	;MsgBox STartted
	;PixelSearch, Tx, Ty, 25, 599, 507, 599, 0X343434, 10, Fast
	PixelSearch, Px, Py, 25, 661, 507, 661, 0X343434, 10, Fast
	if (ErrorLevel = 2) {
		ToolTip, Couldn't find tame values.
		return
	}
	else if (ErrorLevel = 1) {
		ToolTip no tame found
		return
	}	
	else {
		;MsgBox Found %Px%& %Py%
		if ( Px && Py) {
			PixelSearch, Tx, Ty, 25, 599, 507, 599, 0X343434, 10, Fast
			
			torpor := ( Tx -25 ) / 4.83			
			concious := 100 - torpor
			torpor := RegExReplace(torpor,"(?<=\.\d{1}).*$")
			tameProgress := ( Px -25 ) / 4.83
			tameProgress := RegExReplace(tameProgress,"(?<=\.\d{1}).*$")
			concious := RegExReplace(concious,"(?<=\.\d{1}).*$")
			if ( concious > tameProgress ) {
				MsgBox This tame needs extra narcotics
			}
			ToolTip		 TAME:		%tameProgress%`%`nCONSIOUS:	%concious%`% , 20, 680
		}
	}
}


autoFish() {
	color = 0XFFFEFF
	speed = 150
	row = 1465
	column = 1139
	i=0
	Appex = a
	Bppex = b
	
	;;;;Loop, 33 {
	;;;;	i := i + 5
	;;;;	guiName := Appex i
	;;;;	currentRow := row + i
	;;;;	
	;;;;	;Gui %guiName%: +AlwaysOnTop -Caption +ToolWindow
	;;;;	;Gui %guiName%: -Caption +ToolWindow
	;;;;	Gui %guiName%: +AlwaysOnTop -Caption 
	;;;;	
	;;;;	remainder:=Mod(i,10) ; Mod( , ) Returns the remainder when Dividend is divided by Divisor
	;;;;	if ( remainder == 0 ) {
	;;;;		Gui %guiName%:Color, green
	;;;;	} else {
	;;;;		Gui %guiName%:Color, red
	;;;;	}
	;;;;	Gui %guiName%:Show, NA h200 w1 x%currentRow% y%column%
	;;;;	
	;;;;	
	;;;;}
	;;;;i := 0
	;;;;
	;;;;Loop, 40 {
	;;;;	i := i + 5
	;;;;	guiName := Bppex i
	;;;;	currentColumn := column + i
	;;;;	
	;;;;	Gui %guiName%: +AlwaysOnTop -Caption +ToolWindow
	;;;;	
	;;;;	remainder:=Mod(i,10) ; Mod( , ) Returns the remainder when Dividend is divided by Divisor
	;;;;	if ( remainder == 0 ) {
	;;;;		Gui %guiName%:Color, green
	;;;;	} else {
	;;;;		Gui %guiName%:Color, red
	;;;;	}
	;;;;	Gui %guiName%:Show, NA h1 w170 x%row% y%currentColumn%
	;;;;	
	;;;;	
	;;;;}
}


;;;;F7::
;;;;	i := 1
;;;;	ToolTip, STOPPED, 10, 10, 1
;;;;	SetTimer, RemoveToolTip, -5000
;;;;	return
;;;;
;;;;F6::
;;;;	i := 0
;;;;	color = 0xFFFFFF
;;;;	speed = 450
;;;;	MouseClick, left
;;;;	ToolTip, AUTO FISHING Started.`nwaiting for fish... , 10, 10, 1
;;;;
;;;;	while ( %i% = 0 ) 
;;;;	{ 
;;;;	;;Auto Recast Rod 
;;;;		PixelSearch, RecastPx, RecastPy, 958, 623, 958, 623, 0xD0CF3A, 75, Fast ;
;;;;		if (ErrorLevel = 0)
;;;;		{
;;;;			ToolTip, Casting in 3, 10, 10, 1
;;;;			Sleep, 250
;;;;			ToolTip, Casting in 3., 10, 10, 1
;;;;			Sleep, 250
;;;;			ToolTip, Casting in 3.., 10, 10, 1
;;;;			Sleep, 250
;;;;			ToolTip, Casting in 3..., 10, 10, 1
;;;;			Sleep, 250
;;;;			ToolTip, Casting in 2, 10, 10, 1
;;;;			Sleep, 250
;;;;			ToolTip, Casting in 2., 10, 10, 1
;;;;			Sleep, 250
;;;;			ToolTip, Casting in 2.., 10, 10, 1
;;;;			Sleep, 250
;;;;			ToolTip, RCastingin 2..., 10, 10, 1
;;;;			Sleep, 250
;;;;			ToolTip, Casting in 1, 10, 10, 1
;;;;			Sleep, 250
;;;;			ToolTip, Casting in 1., 10, 10, 1
;;;;			Sleep, 250
;;;;			ToolTip, Casting in 1.., 10, 10, 1
;;;;			Sleep, 250
;;;;			ToolTip, Casting in 1..., 10, 10, 1
;;;;			Sleep, 250
;;;;			ToolTip, CASTING!, 10, 10, 1
;;;;			Sleep, 250
;;;;			MouseClick, left
;;;;			Sleep, 1000
;;;;			ToolTip, Waiting for bitewe... , 10, 10, 1
;;;;		}
;;;;		
;;;;		
;;;;		
;;;;	
;;;;	;;Q
;;;;		PixelSearch Px, Py, 1569, 1350, 1585, 1355, color, 3, Fast
;;;;		if (ErrorLevel = 0)
;;;;		{	
;;;;			fishKey("q")
;;;;		}
;;;;
;;;;	;;W
;;;;		PixelSearch Px, Py, 1615, 1160, 1615, 1160, color, 3, Fast
;;;;		if (ErrorLevel = 0)
;;;;		{	
;;;;			fishKey("w")
;;;;		}
;;;;			
;;;;		
;;;;	;;Z
;;;;		PixelSearch Px, Py, 1544, 1306, 1544, 1306, 0XFFFDFF, 3, Fast
;;;;		if (ErrorLevel = 0)
;;;;		{	
;;;;			fishKey("z")
;;;;		}
;;;;			
;;;;	;;X
;;;;		PixelSearch Px, Py, 1587, 1152, 1587, 1152, 0XFFFFFF, 10, Fast
;;;;		if (ErrorLevel = 0)
;;;;		{	
;;;;			fishKey("x")
;;;;		}
;;;;
;;;;	;;A
;;;;		PixelSearch Px, Py, 1550, 1293, 1550, 1293, 0XFFFFFF, 3, Fast
;;;;		if (ErrorLevel = 0)
;;;;		{	
;;;;			fishKey("a")
;;;;		}				
;;;;
;;;;	;;D
;;;;		PixelSearch Px, Py, 1590, 1192, 1590, 1192, 0XFFFFFF, 25, Fast
;;;;		if (ErrorLevel = 0)
;;;;		{	
;;;;			fishKey("d")
;;;;		}	
;;;;
;;;;		
;;;;
;;;;	;;E	
;;;;		PixelSearch Px, Py, 1550, 1241, 1550, 1241, 0XFFFFFF, 3, Fast
;;;;		PixelSearch PxE, PyE, 1581, 1150, 1581, 1150, 0XFFFFFF, 3, Fast
;;;;		PixelSearch PxEN, PyEN, 1564, 1193, 1564, 1193, 0XFFFFFF, 3, Fast
;;;;		if ( Px && Py )  && (PxE && PyE) && (!PxEN && !PyEN) 
;;;;		{
;;;;			fishKey("e")
;;;;		}
;;;;		
;;;;		
;;;;		
;;;;
;;;;	;;C
;;;;		PixelSearch Px, Py, 1512, 1253, 1512, 1253, 0XFFFFFF, 10, Fast
;;;;		PixelSearch PxC, PyC, 1565, 1283, 1565, 1283, 0XFFFFFF, 3, Fast
;;;;		PixelSearch PxCN, PyCN, 1564, 1255, 1564, 1255, 0XFFFFFF, 3, Fast
;;;;		;MsgBox Px=%Px% Py=%Py% PxC=%PxC% PyC=%PyC% PxCN=%PxCN% PyCN=%PyCN% 
;;;;		if ( Px && Py )  && (PxC && PyC) && (!PxCN && !PyCN) 
;;;;		{
;;;;			fishKey("c")
;;;;			Sleep, 300
;;;;		}
;;;;
;;;;
;;;;
;;;;	;;S
;;;;		PixelSearch Px, Py, 1526, 1282, 1526, 1282, 0XFFFFFF, 3, Fast
;;;;		PixelSearch PxS, PyS, 1578, 1290, 1578, 1290, 0XFFFFFF, 3, Fast
;;;;		PixelSearch PxSN, PySN, 1542, 1218, 1542, 1218, 0XFFFFFF, 7, Fast
;;;;		PixelSearch PxSNo, PySNo, 1568, 1217, 1568, 1217, 0XFFFFFF, 7, Fast
;;;;		;MsgBox Px=%Px% Py=%Py% PxS=%PxS% PyS=%PyS% PxSN=%PxSN% PySN=%PySN%
;;;;		if ( Px && Py )  && ( PxS && PyS ) && ( PxSN && PySN ) && (!PxSNo && !PySNo) 
;;;;		{
;;;;			fishKey("s")
;;;;		}
;;;;	}		
;;;;	return



fishKey(X) {
	speed = 450
	switch X
	{
		case "q":	Send, q
		case "w":	Send, w
		case "e":	Send, e
		case "a":	Send, a
		case "s":	Send, s
		case "d":	Send, d
		case "z":	Send, z
		case "x":	Send, x
		case "c":	Send, c
	}
	ToolTip, Sending key %X% , 1247, 728, 1
	Sleep, speed
	return
}


producePoop() {
	IfWinNotActive ARK: Survival Evolved
		{
			Tooltip, Ark not active
			return
		}
	PixelSearch, Px, Py, 2487, 1218, 2550, 1284, 0X909080, 10, Fast
	if (ErrorLevel = 0) {
		ToolTip, POOPING!
		PixelSearch, Px, Py, 163, 134, 163, 134, 0XFFE780, 3, Fast
		if (ErrorLevel = 0) {
			Send {Tab}
			Sleep, 150
			Send {NumpadAdd}
			Sleep, 150
			Send {f}
		}
		else {
			Send {NumpadAdd}
		}
		return
	}
	PixelSearch, Px, Py, 2487, 1218, 2550, 1284, 0X999587, 10, Fast
	if (ErrorLevel = 0) {
		ToolTip, POOPING!
		PixelSearch, Px, Py, 163, 134, 163, 134, 0XFFE780, 3, Fast
		if (ErrorLevel = 0) {
			Send {Tab}
			Sleep, 150
			Send {NumpadAdd}
			Sleep, 150
			Send {f}
		}
		else {
			Send {NumpadAdd}
		}
		return
	}
	return
}


findFolderButton() {
	IfWinNotActive ARK: Survival Evolved
		{
			Tooltip, Folder button not found
			return
		}
	ImageSearch, FoundX, FoundY, 0, 0, A_ScreenWidth, A_ScreenHeight, *2 D:\01-Scripts\AHK-Scripts\ARK Combat Evolved\Images\ARK_FOLDER.png
	if (ErrorLevel = 2)
		MsgBox Could not conduct the search.
	else if (ErrorLevel = 1)
		MsgBox Icon could not be found on the screen.
	else
		MsgBox The icon was found at %FoundX%x%FoundY%.
	return
}


getHealth() {
	IfWinNotActive ARK: Survival Evolved
		{
			ToolTip, ARK Survival Evolved`nis not active.
			return
		}
	PixelSearch, Px, Py, xHealthL, yHealthT, xHealthR, yHealthB, 0x7E670A, 75, Fast
	if (ErrorLevel = 2) {
		ToolTip, Couldn't find health values.
		return
	}
	else if (ErrorLevel = 1) {
		;;Probabbly taking damage+
		return
	}	
	else {
		if %Py% {
			damage := Py - 1363
			;drawHealth(damage)
			damage := damage / 0.62
			;; shouldnt this be 66? as there are 66 pixels or was this a correct calculation? 1424-1363=61
			;; changed fropm 61 to 62. Dont ask me why it was just working better, so i guuess it instead of doing caluclations.. im not getting paid here am I?
			health := 100 - Floor(damage)	
			return health
			;MsgBox health=%health%
			
		}
	return
	}
}

drawHealth(y) {
	startY := 1362 + y
	;MsgBox y=%y%`nstartY=%startY%
	height := 66 - y
	healthColor := y * 100
	healthColor := healthColor / 66
	
	;MsgBox height=%height%
	Gui,  +AlwaysOnTop -Caption +ToolWindow
	if ( healthColor < 45 ) {
		Gui, Color, Green
	}
	else if( healthColor > 75 ) {
		Gui, Color, Red
	}
	else {
		Gui, Color, Yellow
	}
	Gui, Show, NA h%height% w18 x2510 y%startY%
}



^!z::  ; Control+Alt+Z hotkey.
MouseGetPos, MouseX, MouseY
PixelGetColor, color, %MouseX%, %MouseY%
MsgBox The color at the current cursor position is %color%.
return


;; Converts percentage to X pixel according to active screen resolution
convertPixelX(x) {
	x := x * A_ScreenWidth
	x := x / 100
	;x := ( x * A_ScreenWidth ) / 100		;;Does this work?

	return Floor(x)
}

;; Converts percentage to Y pixel according to active screen resolution
convertPixelY(y) {
	y := y * A_ScreenHeight
	y := y / 100
	return Floor(y)
}

RemoveToolTip:
	ToolTip
return

F10::
	Reload
return

F11::
	ExitApp
return
